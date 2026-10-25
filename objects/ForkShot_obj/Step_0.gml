image_angle = direction - 90;

shot_timer--;

if (shot_timer <= 0)
{
    instance_destroy();
}