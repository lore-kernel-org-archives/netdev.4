Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=220.197.31.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600683;
	b=GtOLat1Vj7LYR6JohANreWp4pZ1SfsJ+ZjlGlX1o1xr1Pk/Uf6kjCFjrO2xw513ncZK4
	 ZBDDIdm+vMsHnLw5A4jidHHxAq9kn9hEFEskL6YROnnf88Y4z8IXj8KNFw1VzM4kCCfaN
	 gkrbabiQ5QC3ugapXvLjDdhZ62HfL8w+eIl+tEzTykj4HsAJKI6QqGPoE7IYcjm93IMZD
	 3JGJmHnCy4nOzUSxNbO5ESlxkvqKCEVyxGXpLMyvmMlyGo3hSelXZcGAD4UGgweHHo76Y
	 dCmQAvzmsVg3WBLHmPZTD02J0R5OkJWaeasPEeyymtuTO97RmrlDM5vkZyqb2dOf04A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600683;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:X-CM-TRANSID:X-Coremail-Antispam:
	 X-CM-SenderInfo;
	bh=Nxu6L2hKXuOq/BQVilmRWHy36RXgS3d5UsMYxm7Wdek=;
	b=yHZnXmWAva6kFx3byR+E3dNLhxltAfu556MzHk4+A6zEDrhesZpZ+WKablcXuJNfS341
	 LvunP3JvwmK3nFNX7HPtGLbSpIQa9+vCcL+lFtMVmHTi7q3RR3pvLS4hTpUmPyYqgl4Z/
	 HTxk8ZqOCIU6N85Qf+euAN/KwU202uhPcbCiDpo+leHqTxOddNfdt4fvUwcOfeEhvsI/N
	 ksHI5B+j+pW0PWWxM77O9p6bGCT+6CCWCCqZWwrbaD3gl2NcVlHu2+bRJvweTrdl7/x0a
	 aEI8itIzpCfo/tazpzVZKaDcXs08PZBOWtG+6ol17npqFF7aoY1jQNObsTozipoWOSQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=163.com;
	spf=pass smtp.mailfrom=163.com;
	dkim=pass header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Q9+Bmru0;
	arc=none smtp.remote-ip=220.197.31.4
Received: from m16.mail.163.com (m16.mail.163.com [220.197.31.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4617A606A332
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:57:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4617A606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=163.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=163.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=163.com header.i=@163.com header.a=rsa-sha256 header.s=s110527 header.b=Q9+Bmru0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=163.com;
	s=s110527; h=From:To:Subject:Date:Message-ID:MIME-Version:
	Content-Type; bh=Nxu6L2hKXuOq/BQVilmRWHy36RXgS3d5UsMYxm7Wdek=;
	b=Q9+Bmru0YMgmbi7CkDjC/uNCMW316zFqrdfOT1ZvIcFBZPu50IyWAyLPt6bs+3
	gA9vp9W2FwCCl0z17veFW3IWYot3ZBwQTMl+bazGxn240hFzE3xBlb+NdMfGg4Mx
	mToVTCro/UMyfCfOFrNTeaesYTgXVntW15SGjNuopHWtI=
Received: from ck.. (unknown [])
	by gzsmtp1 (Coremail) with SMTP id PCgvCgDXH4XosAZrhTDbHA--.53977S2;
	Wed, 25 Nov 2026 17:56:57 +0800 (CST)
From: chengke <mjkchengke@163.com>
To: netdev-bot+sinfo@kernel.org
Cc: Frank.Sae@motor-comm.com,
	netdev@vger.kernel.org,
	andrew@lunn.ch,
	hkallweit1@gmail.com,
	linux@armlinux.org.uk,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	mjkchengke@163.com
Subject: Re: [PATCH v2 1/2] net: phy: motorcomm: return -ETIMEDOUT on BMCR reset timeout
Date: Wed, 25 Nov 2026 17:56:56 +0800
Message-ID: <20261125102000.1847020-1-mjkchengke@163.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <179559859720.3294.18444813646422214701@kernel.org>
References: <20261125085509.1844883-1-mjkchengke@163.com> <20261125091638.1847020-1-mjkchengke@163.com> <179559859720.3294.18444813646422214701@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:PCgvCgDXH4XosAZrhTDbHA--.53977S2
X-Coremail-Antispam: 1Uf129KBjvJXoW7uryDKFy3Ar4Dtr1UKFW5trb_yoW8Cr4UpF
	WayF1vqr4ktF1Iva9rtr4UAasagrnxAr47Wr1UXryDA3Z8Gr18tFsIgF1qqa18Kr4vqay7
	tw47uryDA3Z8ZaDanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x0JUtPEhUUUUU=
X-CM-SenderInfo: ppmnux5hqjyvi6rwjhhfrp/xtbC1AnCEWsGsOnk6wAA31

Hi,

Replying to the automated review of this series (this is not a repost).

Regarding patch 1/2 ("net: phy: motorcomm: return -ETIMEDOUT on BMCR
reset timeout"): the issue is theoretical, not triggered at runtime. It
was found by code inspection, and I do not have a stack trace or kernel
message to quote.

Reasoning:

yt8521_modify_bmcr_paged() polls BMCR_RESET with a 500ms budget
(500 x ~1ms). If the loop is exhausted while BMCR_RESET is still set,
the last __phy_read() result (the raw BMCR value, a positive number) is
left in ret, and the err_restore_page path hands it to
phy_restore_page(phydev, old_page, ret), which returns it to the caller
as success.

This is very unlikely to trigger in practice: the PHY completes the
self-clear of BMCR_RESET normally, and a >=500ms hang of the self-clear
would more likely indicate an MDIO bus problem, which would already
have failed the __phy_read() in the loop. So there are no observable
symptoms today; the motivation is correctness only, so that the helper
behaves as documented ("returns 0 or negative errno code") and does not
mask a stuck reset.

I also checked all callers under drivers/net/phy/motorcomm.c
(yt8521_soft_reset, yt8521_resume, yt8521_modify_utp_fiber_bmcr,
yt8531s_set_downshift added by 2/2, and yt8821_modify_utp_fiber_bmcr):
they all treat "ret < 0" as error and propagate it, so a negative
-ETIMEDOUT return does not introduce any new failure path; it only
converts the would-be positive BMCR value into a proper errno.

No functional change is expected on healthy hardware.

If reviewers prefer, I can respin with a "found by inspection" note in
the commit message in the next repost (there may be one anyway for
patch 2/2 review comments); per the bot's instruction I am not reposting
just for this.

Thanks,
chengke

