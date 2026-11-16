Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.53
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794810346;
	b=uddKqRTWEA1mbtWjxGCNPSwNegvQkJKi0ty3oF/ats9t2eRE1D+s5qQyAY4iRiblOSaS
	 dNWa+Gi80UzGq+vQUsJN5Qzi1bW19tuVDzaFAUkrqQaOormf/e0sjGixNCEcFSSYfPjDY
	 MYcI0PketYrRh7ssjZZ8TdGJgRaOj4YEbcS064F8GWuPeIPjYTDL6AqYyFIPa5YJyddiE
	 eK++tNDbjTGWtJ1gTDuOPS/7qBhhUacvhDP9XYp8r2GE3H7Eb11Ny8QvBZjRJ78z4ceXi
	 nJ4/UrbinMnNuwGQ005J7SlPcwsxaURsQ5puuBT1sdjitDCWnt3mL+TGWp1lIqAjWyw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794810346;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:X-Google-Original-From:To:Cc:Subject:Date:Message-ID:X-Mailer:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
	b=3EBOgc5lMMMqGpJxzgQ0Q5y3Tefg41ftlOdyqIVtHqqUaJ5mkvdzNQ18NrGN9+TD4PQO
	 s6Bhd+BdBHrgTwog42yLBBbLTG2sBP/gKap7/+aFEstNDMqEGFHs+YuJ9G/MS99XGW3ps
	 1hZBOu45+mmPDvto+zyOlNVDnxlFNF5PGBH94jYL9D5FftZId93TuX+Mp7wuJXskv6/Tt
	 E+RA338sWDGLIeszq2NXe+XTWSfUpmND1qyZ7MpjMv8vVnBiTYsfwJ+gavpsScvNlx5pc
	 G+N11xY+6eR8a6i/Ck9tPe4eo1jTHspNHoi+xG6Ub0rz50hKgmepsXpNkoF0XdjrLqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oufns9FU;
	arc=none smtp.remote-ip=209.85.221.53
Received: from mail-wr1-f53.google.com (mail-wr1-f53.google.com [209.85.221.53])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 93F57606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 06:25:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 93F57606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Oufns9FU
Received: by mail-wr1-f53.google.com with SMTP id ffacd0b85a97d-4922dbcee23so1366026f8f.0
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 22:25:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794810345; x=1795415145; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
        b=Oufns9FU7gTCAnvw/5Ne3qibyioMzC2ROoGKC9dhHe/MbsoqGf36w9lbEYv9qtD9tR
         lAkeIVMfLH1U41xdEO68gPhFFCWY7J+XL5Ngmlh3iFnCRCUWTvrEbD297nBp9900r6wU
         KFPo0XxG1PGnywRc7ddO4j76ubXFlC95ajAeCrCkTI7l+nPEzVMgZo5sq6+oOIcE5pRu
         96mEBfc2/n6xibkVjEO7O+2aKvgqeY1HeLE3ndbjQX1dxG4sNh9m1Llr/HWvmS3Y+EAd
         nmuWoW5+9gAUqbXBiEgAg7eVtHCgjp7zbVSNMxFouwsHxi0hu7FWElkBa5c5IPdyXkLZ
         Q+2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794810345; x=1795415145;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=hh+R9vrulIDsL2yY8DhJUoEG2kjxAgVjOVJwnKc/m0g=;
        b=h+NliysMKZyfoQ+ueEQSjadhZIUITzWDYHm+A2HkydRgWnrJT73W1WusfLOF+3mM+R
         /EmtHZCcGl9xNeQWNz/HxjXPyplPP01idPwQYL0Cw3KTQtfOaafCH0gfgD8JANRHHEYv
         46JfEBUdnMOX8Kk5YAfVIAdIdjKPbmkUlyt218xQhB9JFZbnjDzgRySZ9n6VgY/B2KfY
         +Ev4TfDIGz/dEj9uH+9hC4W77hvw60MGpCrcMrfloB9UYwX8s69dCrtwwZ+7YFzgRkO7
         N3twN8MdH7OtjBFKAU9q8x5cieomYkAhk76dkGWMK58THgxX5WKWWLh7sCUVTmTnOpDm
         41Zg==
X-Forwarded-Encrypted: i=1; AL+hErEsBTDi1PYqyi7xkqAlZrYKsHioE7Ado5hdwlfn6R0HTdjhntNULY+TMY2hkhxT6x5q9qXdFSY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8CfbMHKYX9IVODWIhRAS5yX5hBMcbKorcWDEDYYCnngdVKGmQY
	lvP2DuoIgSSUw8fTr3Ueoxs2yc55Ftk1k7rEL9uAZR9vbSk0rX19ddmXHB4kAXKVpxTmJiKw
X-Gm-Gg: AYBFou2xRuOgT50alnJqm0FfUmUYwknYXKfC/F4QKis45vaRtWv45r+3GPSPU9XNYPD
	Ywd/5eiiXTWN7AqI/yi5SpoFwjE/0ovhf6qKGCQTRg0sedknuI0/foaL+trMQQYwwauPEIipjlc
	0T4W9Zpcbw3xIK+uY+Z9W//cb6AKPhbczXX32UfkMAQKQYP3/tSAUpE9S8M/5CPSWVTOjgI2cde
	2qy262LLTHmqsh9ldqszkNnHJwNtxpx1hgR0aFTB3buNVP/81shGSPOVyY67IWNoikPZhI1DW1b
	Y42Y5X05tLeBFWW5RpvESxHZjPH26mylJig7qzCYM49GXCWJiI6shJltQQnH4QqjpT340C+jm9S
	r71V3NJ+4z/H5I66jARiYjN8pA99d1UTj5aLhWQr99qq0hZgqH69c+xfr7ussFnx/6dBhf9WYuc
	MEXcZCrcNCypW1UfS3LCcWk6sbDfOXFElLqC1YsOqhOy0fwSf1wGIH1OLTnl3Ua7r5GSvzGRXuu
	V1oYZQXobdSDHc03wdeP9D8GMAvNOfSqRDUdCaWdsfJ1T94IzytCWwIMJ5cae4uH00bkf7hSHpo
	AxaPU4vyTVnsAi6a
X-Received: by 2002:a5d:5d04:0:b0:492:7f3b:8cc3 with SMTP id ffacd0b85a97d-49c725e555bmr17386069f8f.29.1794810344684;
        Sun, 15 Nov 2026 22:25:44 -0800 (PST)
Received: from dl360p ([130.61.107.245])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c609c6451sm21676892f8f.45.2026.11.15.22.25.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 22:25:44 -0800 (PST)
From: Adil Tepe <tadilhusrev@gmail.com>
X-Google-Original-From: Adil Tepe <adil.tepe@basarsoft.com.tr>
To: Jorijn van der Graaf <jorijnvdgraaf@catcrafts.net>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	David Heidelberg <david@ixit.cz>
Cc: =?UTF-8?q?Adil=20H=C3=BCsrev=20Tepe?= <tadilhusrev@gmail.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	netdev@vger.kernel.org,
	oe-linux-nfc@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 5/6] nfc: s3fwrn5: support the S3NRN4V variant
Date: Mon, 16 Nov 2026 09:25:40 +0300
Message-ID: <20261116062542.275485-1-adil.tepe@basarsoft.com.tr>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net>
References: <20260811220135.472380-1-jorijnvdgraaf@catcrafts.net> <20260811220135.472380-6-jorijnvdgraaf@catcrafts.net>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

From: Adil Hüsrev Tepe <tadilhusrev@gmail.com>

Hi Jorijn,

I tested this series on a Samsung Galaxy XCover5 (Exynos850), which has
an S3NRN4V wired to the same lines, so I could exercise the new variant
path with real hardware and a tag. Patches 1-4 are fine here (separate
mail). On this patch I hit a hardware-dependent problem with the fixed
clock-speed byte.

> +/* S3NRN4V single-byte FW_CFG payload; 0x11 selects the 19.2 MHz reference. */
> +#define NCI_PROP_FW_CFG_CLK_SPEED	0x11
[...]
> +int s3fwrn5_nci_clk_cfg(struct s3fwrn5_info *info)
> +{
> +	u8 clk_speed = NCI_PROP_FW_CFG_CLK_SPEED;
> +
> +	return nci_prop_cmd(info->ndev, NCI_PROP_FW_CFG, 1, &clk_speed);
> +}

The XCover5 feeds the S3NRN4V a 26 MHz reference (PMU CLKOUT0 -> TCXO),
not 19.2 MHz. With the byte hardcoded to 0x11 the chip ACKs FW_CFG with
status 0 -- there is no "failed to configure the reference clock" error --
but the RF front end is then off-frequency and the reader never sees a
tag. The failure is completely invisible to host-side polling; only a
physical tag exposes it.

A/B on the XCover5, same tag held on the antenna, 12 s initiator poll per
run (NFC_EVENT_TARGETS_FOUND over the netlink 'events' group):

  FW_CFG 0x11 (19.2 MHz, this patch as posted) : no target in 12 s
  FW_CFG 0x12 (26 MHz, only that byte changed)  : TARGETS_FOUND in ~0.1 s,
                                                  ISO14443-A, proto 0x10

So the single byte is purely board-dependent: 0x11 is correct for a
19.2 MHz part like the FP6, 0x12 for a 26 MHz board like this one, and a
hardcoded value breaks whichever board it does not match.

The driver already holds the reference clock (phy->clk, "failed to get
clock" in this same patch), so the byte can be derived instead of fixed.
Something like:

	unsigned long rate = info->phy ? clk_get_rate(phy->clk) : 0;
	u8 clk_speed;

	switch (rate) {
	case 19200000: clk_speed = 0x11; break;
	case 26000000: clk_speed = 0x12; break;
	default:
		/* keep the posted default when the rate is unknown */
		clk_speed = 0x11;
		break;
	}

(exact plumbing of the clk handle into s3fwrn5_nci_clk_cfg() is yours to
decide; the point is the value must follow clk_get_rate(), not a #define).

With that change the XCover5 reads tags reliably, so I'm happy to give a
Tested-by on a v6 that derives the byte from the clock rate. I did not
Tested-by this patch as posted because it does not bring up NFC on a
26 MHz board.

Two smaller observations on this board, neither a blocker:
 - A prop notification 6F-3F arrives during polling and logs
   "nci_ntf_packet: unsupported ntf opcode 0xf3f" on every poll. A no-op
   handler would silence it.
 - RF calibration blobs: the driver looks for samsung/s3nrn4v/{hwreg,
   swreg}.bin; the stock XCover5 firmware ships them as
   sec_s3nrn4v_{hwreg,swreg}.bin. Just a note for linux-firmware naming;
   NFC works without them here ("RF calibration data update failed: -2"
   is non-fatal).

This was tested on 7.4-rc1 (s3fwrn5 sources at
7.4.0-rc1-00023-gdcb8b91fb779) with patches 1-5 applied, built as
out-of-tree modules and bound to the S3NRN4V via a runtime DT overlay
(compatible = "samsung,s3nrn4v", en/wake GPIOs, pvdd 1.8 V, 26 MHz clk).

The clock-rate finding was located with the help of an AI coding
assistant (Claude Code, Anthropic) during XCover5 mainline bring-up; I
reviewed, reproduced and verified it on hardware myself.

Thanks for doing this series -- it is most of the way to working on a
second board.

Assisted-by: LLM
-- Adil Hüsrev Tepe
