Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.137
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795401044;
	b=ukfEwKOz+iaF1p3qNHDn0fFn+nmTjKV6gxswna+fB4aef1ZTiPPNYP0Lwr8ZEkkfaTT6
	 p/eaAzvxHOPW3eTlqY/1qAMSn2mCKMhWYkmZpkblWWAOHZZtA34ZOm+Je4t2SzKBcq317
	 SoDHqYjn4VQY3g+92q/IRRPJUh9UU3eB45Cly04Z2CItYn3bvzoK2zjHcY0rS80+5PMP/
	 Y+avujNIVp7NGxNAzf7292G6MM1kLdqpuAjDC6feKVq9tHcCj4mrhlcmGRsxkHmp7xDXm
	 ofoPuxOV/cZfUXZwJ6sWwLioHxTkbHmSWn3bCPi8Hi3aNkli9t2T8sGRDWPruOql5/A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795401044;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Cq/cYX7/b8Dzuiz6ClHov3WU2VvNwLYaxpdD04so0IE=;
	b=vZ7Fme7ofTGhpWHsRWLGASsEC+ElB4Pmvcp2lQpFMThjajXMgyLLejquDMgwXFDTe1nl
	 bkYUMt8i8pF5yCvkp6PK4/ASuRIF0c9JDb4pL2+63MTYXv5yDHsTrU0z5pxhUQsAXafNK
	 3xLknxaqmWUldeF61uJlm20OmkAhosz0lM/JMzOpzMM2pUaeu/zjO3hdn07weHaYNW+pn
	 pPU9EJNxpondM9iy9VpL65yacaVA+q5BtVxI+dnN5P1imvK/+/CdJZpmMnCG7u6oUq7uo
	 UDWpACYyx6DIqdkyr2ArMMgrQXGkRatfTOW45pkJD/IxBXvjND1M47MfgupTKYNYrcA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b="ap/m1zbY";
	arc=none smtp.remote-ip=111.22.67.137
Received: from cmccmta4.chinamobile.com (cmccmta4.chinamobile.com [111.22.67.137])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 05D7A606A31E;
	Mon, 23 Nov 2026 02:30:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 05D7A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=ap/m1zbY
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=ap/m1zbYYyigZzmloFF1/kMe45Uwudj+XEMEQDffMpBkOcCeebRzKl75HJ7IV3EWn10AteMNIu13P
	 rXRiQiRnNIN0WVk5MEvkOA8nVdCkHLF/EJkotgDpYOmTMSESdVZEFjuROg7O8OcFyHtYYW6jj9l0r8
	 bcI/T8hj/h4Rwx2U=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app04-12004 (RichMail) with SMTP id 2ee46b03a54e409-d7b05;
	Mon, 23 Nov 2026 10:30:41 +0800 (CST)
X-RM-TRANSID:2ee46b03a54e409-d7b05
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr02-12002 (RichMail) with SMTP id 2ee26b03a54f965-83027;
	Mon, 23 Nov 2026 10:30:41 +0800 (CST)
X-RM-TRANSID:2ee26b03a54f965-83027
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
Subject: Re: [PATCH] net: dsa: mt7530: fix regulator leak in mt7530_setup()
Date: Mon, 23 Nov 2026 10:30:41 +0800
Message-ID: <20261123023041.609-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179531318026.3135.909782780821579093@kernel.org>
References: <179531318026.3135.909782780821579093@kernel.org>
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

Hi,

On Sun, 22 Nov 2026 02:06:20 +0000, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> - [High] The fix is incomplete.
> - [Medium] The new err_powers/err_disable_core_pwr paths in
>   mt7530_setup() disable core_pwr/io_pwr, but mt7530_remove() was not??> - [Low] This is speculative and depends on the hardware.

Thanks for the review, I verified all three findings against the code
and agree with them:

* High: Correct.  The v2 error paths only covered mt7530_setup()
  itself, while mt7530_setup_irq(), mt7530_setup_mdio() (both can also
  return -EPROBE_DEFER), the SGMII PCS creation and the DSA core
  setup steps can all fail afterwards with the regulators left
  enabled, so the fix was indeed incomplete.

* Medium: Correct.  In a multi-switch tree a switch can bind while its
  ds->ops->setup has not run yet, and a later failing setup of that
  switch is reported through the other switch's probe.  The v2
  unwinding would then have left the bound switch with an unbalanced
  regulator_disable() in mt7530_remove().

* Low: Point taken.  It is speculative for a software-only fix, and
  mt7530_remove() already disables the regulators in the same order.

I have posted a v3 that adopts the ownership suggestion from the
review instead of unwinding manually:

  [PATCH v3] net: dsa: mt7530: manage the core and io regulators with devm actions
  https://lore.kernel.org/r/20261123022415.433-1-laixiangwu@cmss.chinamobile.com

The enables now live in mt7530_probe(), each paired with a
devm_add_action_or_reset() that disables the regulator again, and the
explicit disables in mt7530_remove() are gone.  This covers every
error path after the enables and keeps the enables and disables
balanced in all combinations of probe, setup and unbind.

For reference, the earlier versions of this fix:

  v1: https://lore.kernel.org/r/20261118014114.1855-1-laixiangwu@cmss.chinamobile.com
  v2: https://lore.kernel.org/r/20261119060424.1476-1-laixiangwu@cmss.chinamobile.com

pw-bot: cr

Best regards,
Xiangwu Lai


