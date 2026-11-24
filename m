Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=212.77.101.11
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795550914;
	b=AocNUuUqBv3b5sy0tjUIK0qbDmKXe2bL9uv30IOHKLWu4KiSjQcoJ0doojRnchL//+bk
	 L27B0HnN6kiaOI+1uk7G+wtntgUq2AcnQBWWD/AJW7RGonq1lMCbz0cieMODx1krx2EXV
	 UvPZ0Bah0B2EQO2Hrsc25T2uFvJosf04lCtNo9w3BO+ib7edQs62bicoFGjFCYOU8vV/K
	 KL75YyEETc6riwqZlzCpi7P7opj1SKf1R13twhrgtvp1uD+1FBPOYSdHRWry6cY8uAnU7
	 6/nZLs0KIEQH2OPydM6c51d/gBoP3aMQxBczk993a/DqdAWWyi1RZ/bTg/5OE/Zguvg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795550914;
	h=DMARC-Filter:Received:DKIM-Signature:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Subject:To:Cc:References:Content-Language:
	 From:In-Reply-To:Content-Type:Content-Transfer-Encoding:X-WP-MailID:
	 X-WP-AV:X-WP-SPAM;
	bh=z2zaibnJukNuiC5JwXZOB/K5mbPDbWJDM8nKChrkxvY=;
	b=HOG6GZ6s9lMrBuYuYn77isO6i+p4DvYKLNRLsuHsMvIMVEWkjSE/Ba5rUXk6TlX/JKR0
	 Wmzy/m2KP8I/6wIVXYtzib+1CRwzBHqRWA0DhsYWKckz102oAYK9VveHcam9GP9GPgZvF
	 iN2B/aP36jTqovsqKJWgybtRiDyIHMu1RgBRKgPhzQ7s3WjKAw2beIsxj0LQJUln98+Gn
	 Bu/k/99v8pxIPiVWDecvCRvM17DnFkJIrlIlw68Up75XB9lk5JSeASrEJrWGJ4qUPK82D
	 w49SZXupPA7+q1eCUSL+WU2z0ujrZsJLD6s/PWaKyS/Q4Ph8ZlswthQNxVvTfEQs3Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=wp.pl;
	spf=pass smtp.mailfrom=wp.pl;
	dkim=pass header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=icpQTCG1;
	arc=none smtp.remote-ip=212.77.101.11
Received: from mx4.wp.pl (mx4.wp.pl [212.77.101.11])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68947606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 20:08:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68947606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=wp.pl
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=wp.pl
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=wp.pl header.i=@wp.pl header.a=rsa-sha256 header.s=s20261001 header.b=icpQTCG1
Received: (wp-smtpd smtp.wp.pl 17810 invoked from network); 24 Nov 2026 21:08:19 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=wp.pl; s=s20261001;
          t=1795550899; bh=z2zaibnJukNuiC5JwXZOB/K5mbPDbWJDM8nKChrkxvY=;
          h=Subject:To:Cc:From;
          b=icpQTCG1YoURKiCWt2nEAeqitFSP5H98//xyEWy1XYbiHy3mBPV9ZMg36KlriNUlf
           4YYvYd+6vlEDNgpCYFb5i+lRAi80m5FKuYSXUQuOU5KYwbKtWlpOkzQeMMsLSMqzUa
           1B/r5bJkxUAsv8uh59UOqZQvmvR2J93kmf5z+1b1vAkYTcbZoMfiGW/vzh0EB53EQU
           tVhdiWypa2ziEV0Wynj8szZX3Tj+4ePPfTtojAZwXdwmJnhpVrl43/rbEC9LsQJJcc
           E+4kycviCk0OK+3ekGhIOLyrXwimHtLEJ+sULzZ3jwiZ2bnm3GZAnUWI/uoIhT7cR1
           1QSiZXp0nCQsA==
Received: from [192.168.3.224] (83.5.167.37.ipv4.supernova.orange.pl [83.5.167.37])
          (envelope-sender <olek2@wp.pl>)
          by smtp.wp.pl (WP-SMTPD) with TLS_AES_256_GCM_SHA384 encrypted SMTP
          for <andrew@lunn.ch>; 24 Nov 2026 21:08:19 +0100
Message-ID: <4dd66fbe-4528-4e88-91d4-87e147aa71cd@wp.pl>
Date: Tue, 24 Nov 2026 21:08:13 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v3] net: phy: marvell: add support for PHY LEDs
 polarity modes
To: Andrew Lunn <andrew@lunn.ch>
Cc: skyline@mail.ru, hkallweit1@gmail.com, linux@armlinux.org.uk,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org
References: <20261122213034.548858-1-olek2@wp.pl>
 <992ef2e7-4334-4b0e-b1ea-5ac1360fefea@lunn.ch>
Content-Language: pl
From: Aleksander Jan Bajkowski <olek2@wp.pl>
In-Reply-To: <992ef2e7-4334-4b0e-b1ea-5ac1360fefea@lunn.ch>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-WP-MailID: a678dafce487f5e36b6837f41410cc96
X-WP-AV: skaner antywirusowy Poczty Wirtualnej Polski
X-WP-SPAM: NO 000000A [IfME]                               

Hi Andrew

On 22/11/2026 22:55, Andrew Lunn wrote:
> On Sun, Nov 22, 2026 at 10:28:55PM +0100, Aleksander Jan Bajkowski wrote:
>> Keep the LED polarization settings and restore them after a hardware
>> reset. This modification is actually only necessary on devices with a
>> wired PHY reset line and a driver that resets the PHY during the
>> link-up/link-down events. I found a single DTS file in OpenWRT
>> (armada-385-fortinet-fg-5xe.dtsi) that matches this hardware configuration.
> Mainline does not really care about OpenWRT. However, why does
> armada-385-fortinet-fg-5xe.dtsi do this? Is it because of an errata in
> the PHY? Such an errata we might care about.

This is not an errata. This is a direct response to sashiko's report[1]:

Take a board with a PHY reset GPIO and a MAC driver that connects the PHY
in ndo_open and disconnects it in ndo_stop. Wouldn't each "ip link set
down" followed by "ip link set up" put the LED pins back to their reset
default polarity and drive state?

This is actually a widespread  issue. PHYs from various vendors restore the
default state of the registers after a hardware reset. Phylink does not
restore triggers later.

1. 
https://sashiko.dev/#/message/179032601295.2160803.13373677668767022640%40kernel.org 

>
>>   static int marvell_config_init(struct phy_device *phydev)
>>   {
>> +	struct marvell_priv *priv = phydev->priv;
>> +	int err;
>> +
>>   	/* Set default LED */
>>   	marvell_config_led(phydev);
>>   
>> +	/* Restore the LED polarity settings after a reset. */
>> +	if (priv->led_polarity_mask) {
>> +		err = phy_modify_paged(phydev, MII_MARVELL_LED_PAGE,
>> +				       MII_88E1318S_PHY_LED_POL,
>> +				       priv->led_polarity_mask,
>> +				       priv->led_polarity_val);
> This does not make much sense to me. If you have lost polarity, you
> have also likely lost the LED blinks modes. So you are only restoring
> part of the state?
>
> And this is for a device which does not even exist in mainline.
>
> I suggest KISS, throw this out.

That makes sense. I'll throw it out in the next iteration. We may
return to this topic once someone adds an dts upstream that requires
such a modification.

Best regards,
Aleksander

