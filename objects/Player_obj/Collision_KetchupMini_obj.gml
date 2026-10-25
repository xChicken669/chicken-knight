hp -= 10
part_particles_create(
      hit_ps,
      x,
      y,
      hit_pt,
      15
);

audio_play_sound(explosion, 1, false);
hp -= 20;
instance_destroy(other)
