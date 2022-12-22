#include "LedHandler.h"

LedHandler::LedHandler(QString ledPath, QObject *parent) : QObject(parent)
{
    this->file = new QFile(ledPath);
    this->file->open(QIODevice::WriteOnly);
    this->brightness = 0;
    this->enabled = false;
    this->writeBrightness(0);
}

void LedHandler::setEnabled(bool enabled)
{
    this->enabled = enabled;
    if (enabled)
        this->writeBrightness(brightness);
    else
        this->writeBrightness(0);
}

void LedHandler::setBrightness(unsigned int brightness)
{
    this->brightness = brightness;
    if (this->enabled)
        this->writeBrightness(brightness);
}

void LedHandler::writeBrightness(unsigned int brightness)
{
    this->file->write(QString::number(brightness).toLatin1());
    this->file->flush();
}
