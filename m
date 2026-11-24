Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795484336;
	b=nTkpxPfUjgho+aPA681c4NQo49UHoRktbSgQPZWBXY8B1+OxgTBTJ9kUNRM2ShhqXxY1
	 sUI+vWvS9IuNhqiQJCJMlc/FHZK31YnJ2G9VBJa4jGc5s3y5xoNYOm/qQUIivZF4cuxwb
	 U6pdAE3KHBIgFfiw8wr+RBKrrBF1EawsJsqhbm95Wt8aLSrx8zzkV1lqfYsEOoAZxkgyp
	 euAVJ3uEifT3dMQ8sMC4n1Dih3zfvUVSOhwm7tm+foNRTYJ4gVSWeaJ2774fNdIs1vccS
	 X6SaQ1HOTHsw38VXCwsnJQY1YweA6nEDRs65LHXkLxnTO92UeLYfFA/KiVonNn/twjQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795484336;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=UrsxTwQWNnPxqy/+u/D6/SODCBpmj/qInDB3Yqh00ck=;
	b=UIRjDMZ6vhCXPm33XvyxJYa+yWOe0V4yEz5KaSMbDaYdjdwsTiLHwXM/OGgwVvE3p2Kx
	 In2DLRYG0G63gbA11KhZh8ogQDT0k0i31b++CQVb9ZdTsQB8nzex+5a4/iPBxbkhJFcxM
	 s68eu/g423h5ZpgIbrFLHXdMO2rFNzMLYUTK16MWJZHrqxkWRNfyMZz4CNj/cu0gbUONN
	 hSAB0QYkx0gPvW05vLHkVV9Txhl45kGzF1SHzfasCs9+IlvK/p5MmW5kXLDFZeoHg8BIS
	 N5lucpVGhGG49fsj2Sbp3CgzUy932ypPiLjt0gG5JCM2i0VJUOqMVvbqTAE25jlEaLg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=z4MjaWR9;
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 663C5606A31E;
	Tue, 24 Nov 2026 01:38:55 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 663C5606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=z4MjaWR9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=z4MjaWR90MXKBH3gOd6AZHLAwhyV7lkVPn4IkseHF4mAG0sspcNNXj7l5PyCIsLucjcgCIeIo/yy+
	 Fgh0BU6iQZBAVQrhtA+TiomwiUvj9UUmfD2zc1HFnGHi5WpTC4dOZEMJC41SkhD5lniiAWkdYqLzXm
	 uFKzTHZD5kn96bJM=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app08-12008 (RichMail) with SMTP id 2ee86b04eaac59b-e1ec6;
	Tue, 24 Nov 2026 09:38:53 +0800 (CST)
X-RM-TRANSID:2ee86b04eaac59b-e1ec6
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr04-12004 (RichMail) with SMTP id 2ee46b04eaab172-0e260;
	Tue, 24 Nov 2026 09:38:53 +0800 (CST)
X-RM-TRANSID:2ee46b04eaab172-0e260
From: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>
To: andrew@lunn.ch
Cc: Xiangwu Lai <laixiangwu@cmss.chinamobile.com>,
	chester.a.unal@arinc9.com,
	daniel@makrotopia.org,
	olteanv@gmail.com,
	sean.wang@mediatek.com,
	netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	netdev-bot+sashiko@kernel.org
Subject: Re: [PATCH v3] net: dsa: mt7530: manage the core and io regulators with devm actions
Date: Tue, 24 Nov 2026 09:38:51 +0800
Message-ID: <20261124013852.1101-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <426c9bff-1928-4829-a3e0-dc021e4c783e@lunn.ch>
References: <426c9bff-1928-4829-a3e0-dc021e4c783e@lunn.ch>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Hi Andrew,

Thanks for the review of "[PATCH v3] net: dsa: mt7530: manage the core
and io regulators with devm actions"
(https://lore.kernel.org/r/20261123022415.433-1-laixiangwu@cmss.chinamobile.com).

> > Move the enables to mt7530_probe(), right after the regulators are
> > acquired
>
> Please add an explanation why this is safe. Since the original code
> did not do this, there might be a reason it is done later.

Done in v4.  The short version: nothing accesses the switch between
the enables and dsa_register_switch().  The reset line has been
asserted since it was acquired in mt7530_probe() with GPIOD_OUT_LOW,
so the rails come up while the chip is held in reset, and
mt7530_setup() still releases the reset afterwards, unchanged.
MT7621 has no such supplies (skipped by the ID_MT7530 guards) and the
MT7988 MMIO variant has no regulators at all.  I could not find a
reason in the history of b8f126a8d543 why the enables were done in
setup rather than probe - it just grew there when the driver was
originally written.

> This is maybe one case where devm is the wrong solution. Please keep
> with the normal way of doing cleanup.

Understood - v4 drops the devm_add_action_or_reset() calls.  The
enables stay in mt7530_probe(), but a later failure now unwinds with
plain error labels, and the explicit disables in mt7530_remove() are
restored.  This keeps every failure path balanced: a failed probe
always unwinds (including -EPROBE_DEFER retries), and a switch that
stays bound is disabled exactly once by mt7530_remove().

> > Fixes: b8f126a8d543 ("net-next: dsa: add dsa support for Mediatek MT7530 switch")
>
> Who does this bother?

Honestly: nobody has reported it.  I found the leak by code inspection
and have no MT7530 hardware.  In-tree, the boards that wire these
supplies are the MT7623 ones (mt7623n-bananapi-bpi-r2 and
mt7623n-rfb-emmc via mt7623a.dtsi), and they connect them to switchable
MT6323 PMIC outputs, so there the leak would keep the supplies on
after a failed probe and trip the WARN_ON(enable_count) in
_regulator_put() when the devm handles are released.  It is a
robustness fix rather than a fix for an observed failure.  If you
prefer, I am happy to drop the Fixes tag so it does not go to
stable - your call.

v4 is here:
  [PATCH v4] net: dsa: mt7530: enable the regulators in probe() and unwind on error
  https://lore.kernel.org/r/20261124013422.1408-1-laixiangwu@cmss.chinamobile.com

Best regards,
Xiangwu Lai


