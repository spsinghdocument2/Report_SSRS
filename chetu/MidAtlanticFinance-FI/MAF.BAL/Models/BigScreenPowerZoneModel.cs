namespace MAF.BAL.Models
{
    using System;

    public class BigScreenPowerZoneModel
    {
        public TimeSpan? Zone1FromTime { get; set; }
        public TimeSpan? Zone1ToTime { get; set; }
        public TimeSpan? Zone2FromTime { get; set; }
        public TimeSpan? Zone2ToTime { get; set; }
        public string Header1Color { get; set; }
        public string Header2Color { get; set; }
        public string RowColor { get; set; }
        public string AlternateRowColor { get; set; }
        public string FontColor { get; set; }
        public string Queues { get; set; }
    }
}
