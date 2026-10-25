for (var i = 0; i < 11; i++)
            {
                var _shot = instance_create_layer(
                    x, y, "Instances", ForkShot_obj
                );

                _shot.direction = i * 360 / 11;
                _shot.image_angle = _shot.direction - 90;
            }
alarm_set(3,20)