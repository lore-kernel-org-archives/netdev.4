Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795573477;
	b=U80dSIUWAcjfZwiow5UgsoIdMiKRMlyMicEEZ4WXk5gI/7m7pvmBX7vJK2pqTG1xkMze
	 pvdFaKPA3PFyjVkwaY9KXDeOFxDL/T5xcuUrwIZ3RYDZqYFiwH57QDIOjx4WXCA6iAdHc
	 rKqsIyZCvQXn53o7rC+3DzEYv5GX7JsQKXd+iAjCvWU6+aMukfuTjxKHzgftwcea1c1+N
	 m7vH6SKU84ApKUsevdmDXb4IRjWIRo6w7cOo1tvaRmYx16OxRmBc5POrntU95HKBdwoHI
	 d73AAENGjwUkwIec5P/z1LZ46ELzgIIeCIddVlKpKds16qOCZ3FC68aGyHQJfjApLMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795573477;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=dHHQ7jSaJxbUODBdGi0CeB6ULyimgP5oUJ8IXyEveFU=;
	b=yI1N9gJlGJtQyipflYSh/qwtjbldfNtQoWT/qJfqFqERoitdlNL0UpY1bqn96AIzsLtN
	 osH1aw074zxR+wVJolodJj0SEyv7lOqQ4k0drtTokS6Il2ce/lM61XzTD8nE0OEL4RCMZ
	 MYtjAzLqS1TFAUXV549GOLI0PnNn9o/gN3hFo0AMZV+hdeOfxa6/pm9Q1zLh0L+fmaqAf
	 2c9hDlIn94Wez4jUthWeuWxYDxy7sQYtTe5oJUqKlNgvL82AA1hPLXJ5+4z/rSL/aKgIH
	 CGDbbe9NcYPTj+JPL9u2PQSiy5lKda+KK2rWt/11Q6yPDMz8msGNTlaPbh6mF2H1nIQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VEpg09sO;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 382EC606A321;
	Wed, 25 Nov 2026 02:24:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 382EC606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=VEpg09sO
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=VEpg09sODpnapN/a9Jw9ortGlUt7I7WRsY/TLmuNzBL0nHKgoTeyYnWeo1QObro9twx/NwcSMIKFz
	 rpI//pHydTFO98DWB9ZzfP4axZbBdkI5pDGGX0A01zVDu5VABhBM8hG3ho9XqHpOT2dkB9x2Mu8iHV
	 jo0ScwjbiK6/3VuU=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26b0646e23e3-88c53;
	Wed, 25 Nov 2026 10:24:34 +0800 (CST)
X-RM-TRANSID:2ee26b0646e23e3-88c53
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr07-12007 (RichMail) with SMTP id 2ee76b0646e0cbe-35130;
	Wed, 25 Nov 2026 10:24:34 +0800 (CST)
X-RM-TRANSID:2ee76b0646e0cbe-35130
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: netdev-bot+sashiko@kernel.org
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	andrew@lunn.ch,
	olteanv@gmail.com,
	sean.wang@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kuba@kernel.org
Subject: Re: [PATCH v4] net: dsa: mt7530: enable the regulators in probe() and unwind on error
Date: Wed, 25 Nov 2026 10:24:32 +0800
Message-ID: <20261125030000.377-2-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179557049962.3135.7449288288799250763@kernel.org>
References: <179557049962.3135.7449288288799250763@kernel.org>
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

Hello,

On the review of v4 (Subject: [PATCH v4] net: dsa: mt7530: enable the
regulators in probe() and unwind on error,
https://lore.kernel.org/all/20261124013422.1408-1-laixiangwu@cmss.chinamobile.com/):

> [Severity: Medium]
> Does the safety argument in the commit message hold when the switch is a
> multi-chip module? ... When mediatek,mcm is set there is no reset GPIO.
> mt7530_probe() only gets a handle to the reset control, and getting the
> handle does not assert it ... The first assert happens in mt7530_setup()
> ... The boards that get mediatek,mcm plus core-supply and io-supply from
> mt7623a.dtsi are mt7623a-rfb-emmc.dts and mt7623a-rfb-nand.dts.

Both parts of this finding are correct, thank you.  I verified:

  - On the mcm path mt7530_probe() only calls devm_reset_control_get();
    the first reset_control_assert() is at the top of mt7530_setup(),
    which only runs from dsa_register_switch().  So on the mcm boards
    the chip runs on its power-on defaults between probe and setup.
  - The board list in the v4 commit message was wrong.
    mt7623n-bananapi-bpi-r2.dts and mt7623n-rfb-emmc.dts include
    mt7623n.dtsi and wire the supplies and reset-gpios inline; those
    boards are held in reset while the rails come up.  The boards that
    get mediatek,mcm and the supplies from mt7623a.dtsi are
    mt7623a-rfb-emmc.dts and mt7623a-rfb-nand.dts.

V5 with the corrected commit message is out; the diff is unchanged:

  [PATCH v5] net: dsa: mt7530: enable the regulators in probe() and unwind on error
  https://lore.kernel.org/all/20261125022147.377-1-laixiangwu@cmss.chinamobile.com/

The v5 message now scopes the reset-held argument to the reset-gpios
boards and describes the mcm window as it is, including that it
repeats on -EPROBE_DEFER and is unbounded while a multi-switch tree
waits for its other members.

> [Severity: Low]
> Is this teardown order safe when dsa_register_switch() fails after
> mt753x_setup() has already run? ... the IRQ chip and the internal MDIO
> bus are therefore released by devres_release_all() after mt7530_probe()
> returns, which is after these labels have already cut the supplies.
> If the threaded regmap-irq handler runs in that window, it reads
> MT7530_SYS_INT_STS from an unpowered chip.

The mechanics are correct: mt7530_setup_irq() registers the IRQ chip
with devm_regmap_add_irq_chip_fwnode() and mt7530_setup_mdio() with
devm_of_mdiobus_register(), both on the mdiodev, and mt753x_teardown()
only cancels stats_work, so those resources do live until
devres_release_all() after the probe returns.

I would scope the practical impact as follows:

  - None of the in-tree MT7530 boards that wire the regulators
    (mt7623a-rfb-emmc, mt7623a-rfb-nand, mt7623n-bananapi-bpi-r2,
    mt7623n-rfb-emmc) wire the switch interrupt, so
    mt7530_setup_irq() takes the "no interrupt support" exit and there
    is no regmap-irq handler to run in the window.
  - The create_sgmii() example path is MT7531, which has no regulators;
    the error labels are guarded by priv->id == ID_MT7530 and are no-ops
    there.
  - devm was deliberately ruled out for this driver per the netdev
    maintainer guidance (the disables are plain error labels on
    request of the tree owner), so the "register the disables with
    devm" suggestion is not an option here.
  - mt7530_remove() in the unmodified driver also cuts the supplies
    before the devm resources are released, so the probe error path
    now mirrors the existing remove order rather than introducing a
    brand new shape.

That said, asserting the reset control and releasing the setup
resources before disabling the supplies in the probe error path would
be a cleaner unwind, and I am happy to add it if the maintainers want
it; that is Andrew's call to make.

pw-bot: cr


