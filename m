Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=111.22.67.151
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795416003;
	b=m7n+Sf1y+nRpUZ4IFId61ufYQLQig9xWGxTkkGiFW2k6lB9sJn2RQwP1eAVhvHnV/Qzv
	 7co7R1xEKQZBdoHDjSYK+Pv1Qdh2dzg/Yt/6Dv+3bCPJcJQdNvf2YVHoz7SQI6YS59Jv5
	 MX/ENL84P+mhiHDXtW62xdNOS60/PwobDqX4RieeyK6+MklnKMSsXoRJhCE1fQpdwmMLI
	 vWKjySDqEOC9JnubjqfinMjf3thtslej12INqra9+nhZroOKZ3rd3c7oJjfbUIOVKvlFt
	 cvVZJDcuDcD8n8+HcRwcG6Azfd2JpFjQ8O12rpGkJzZUyW58EKTnWA66FzC8hFgnO7A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795416003;
	h=DMARC-Filter:DKIM-Signature:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:
	 X-RM-TRANSID:X-RM-TagInfo:X-RM-SPAM-FLAG:Received:X-RM-TRANSID:From:
	 To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=tFBbEjTVG6FIv+j1Fe5z/DyiO1sZmnfSor6MAode+lY=;
	b=zsHF7xhDetiJZZKZcq6MF0DqkSvVdEDV+KxsHkmarc9oZUKQHSvaW8r/zs35ZQrsEkGT
	 mzBOwaNPhB0FUxy/4vKVK/bXskpxT4JnQMKned8JsvRMgAHk5bYKQWHfC8oeOeUnjv8ep
	 jSi+fDaYxZ+6yFJt4+UC4Wusr+N2qEwyT6k6JOFvD9v8bLw+DIjwhk9SdKp+kRECPuKDS
	 NXAdvuGatROFBIlTsDzKyjY0SJNOG4j+s5/7XJ2ydJ81xNCQ39GaJla8RBW5d/b2Zr3O9
	 16SMnysjD2MQzp3vebE/RktNlVdkpmXslHciET3x6sADn0MwuQeaNqVl4vtF1UTyKCQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=cmss.chinamobile.com;
	spf=pass smtp.mailfrom=cmss.chinamobile.com;
	dkim=pass header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=m5FAcMP5;
	arc=none smtp.remote-ip=111.22.67.151
Received: from cmccmta8.chinamobile.com (cmccmta8.chinamobile.com [111.22.67.151])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 939B7606A31E;
	Mon, 23 Nov 2026 06:40:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 939B7606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cmss.chinamobile.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cmss.chinamobile.com header.i=@cmss.chinamobile.com header.a=rsa-sha256 header.s=default header.b=m5FAcMP5
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=cmss.chinamobile.com; s=default; l=0;
	h=from:subject:message-id:to:cc:mime-version;
	bh=47DEQpj8HBSa+/TImW+5JCeuQeRkm5NMpJWZG3hSuFU=;
	b=m5FAcMP5GayGRHDFII3ji4FuUvBJu3AQnlmD2t8GWrv151nFaSffl+dqQ/d74eUajkkGtxgtJjZVs
	 lgn4DGUoMySvpFsJBkUE8gFQKn6cU8HQdmcrtR8Vp6VxbIXoBMTggQJFWbbFPG6MZVXMbq7UtLwKdE
	 npAfzTD7QRhVWubQ=
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from spf.mail.chinamobile.com (unknown[10.188.0.87])
	by rmmx-syy-dmz-app02-12002 (RichMail) with SMTP id 2ee26b03dfbfd79-764ec;
	Mon, 23 Nov 2026 14:39:59 +0800 (CST)
X-RM-TRANSID:2ee26b03dfbfd79-764ec
X-RM-TagInfo: emlType=0                                       
X-RM-SPAM-FLAG:00000000
Received:from DESKTOP-3K8GUTQ (unknown[223.108.79.98])
	by rmsmtp-syy-appsvr01-12001 (RichMail) with SMTP id 2ee16b03dfbc90c-8a1ad;
	Mon, 23 Nov 2026 14:39:59 +0800 (CST)
X-RM-TRANSID:2ee16b03dfbc90c-8a1ad
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
Subject: Re: [PATCH v2] net: dsa: mt7530: fix regulator leak in mt7530_setup()
Date: Mon, 23 Nov 2026 14:39:59 +0800
Message-ID: <20261123063959.147-1-laixiangwu@cmss.chinamobile.com>
X-Mailer: git-send-email 2.50.1.windows.1
In-Reply-To: <179541469889.3135.11276449301186567298@kernel.org>
References: <179541469889.3135.11276449301186567298@kernel.org>
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

On Mon, 23 Nov 2026 06:18:18 +0000, netdev-bot+sashiko wrote:
> Thank you for your contribution! Sashiko AI review found 3 potential
> issue(s) to consider.
>
> - [High] The fix is incomplete: the regulator leak the commit message
>   describes can still happen.
> - [Medium] Possible double disable: the new error labels in
>   mt7530_setup() disable core_pwr/io_pwr, but mt7530_remove() still...
> - [Low] Possible power-down ordering problem (speculative): the new
>   err_powers / err_disable_core_pwr rollback in mt7530_setup() disables...

Thanks for the review.  These are the same three issues that were found
in the review of v1 [1], and I agree with all of them for v2 as well:

* High: Correct.  The chained error labels only unwind failures inside
  mt7530_setup().  mt7530_setup_irq(), mt7530_setup_mdio() (both can
  return -EPROBE_DEFER), the SGMII PCS creation and the DSA core setup
  steps can still fail with the regulators left enabled, and each
  deferred probe retry would leak one more enable.

* Medium: Correct.  In a multi-switch tree, a switch can stay bound
  without its ds->ops->setup having run; a later failing setup is
  reported through the other switch's probe.  With the v2 unwinding
  bringing the enable count back to zero, the later unbind would then
  hit the unbalanced regulator_disable() in mt7530_remove().

* Low: Point taken, it is speculative for a software-only fix, and
  mt7530_remove() already disables the regulators in the same order.

v2 has been superseded by v3 [2], which adopts the structure suggested
in the review ("move the enable/disable into a properly paired place,
such as probe with a devm action"):

  [PATCH v3] net: dsa: mt7530: manage the core and io regulators with devm actions
  https://lore.kernel.org/r/20261123022415.433-1-laixiangwu@cmss.chinamobile.com

The enables now live in mt7530_probe(), each paired with a
devm_add_action_or_reset() callback, mt7530_setup() is back to its
original shape, and mt7530_remove() no longer touches the regulators.
This resolves all three findings: every later failure path (including
-EPROBE_DEFER retries and the bind-without-setup case) is covered by
the devm actions, and there is no second disable anywhere.

pw-bot: cr

[1] https://lore.kernel.org/r/179531318026.3135.909782780821579093@kernel.org
[2] https://lore.kernel.org/r/20261123022415.433-1-laixiangwu@cmss.chinamobile.com

Best regards,
Xiangwu Lai


