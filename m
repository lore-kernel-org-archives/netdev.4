Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.208.142.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795111151;
	b=VAZGSROFgyfVYqxbrQ7eCKeTFRwGoLv17Jl5I2WvKkBhJg6dku4WRRLRR77R2694M2sF
	 vBgu+BujPF1BoAh12PjvaglImfVuj6U7bzmIL7SJKCTIYGTQJ4AR7Gaqc4zUPvhW3V+E8
	 xKipFqslqEMla41U+ucmWIfUs3BPYQm+4knV7hCvirGytd9ohOYlRO2hcZ3k5zgpd1n3Q
	 4RzdgIC0yTTwCUkFwe1UraYGkNqaOzzYdCjzTACmmZpv1Tth2lZ8a8k9hmdM0kgY955CJ
	 hmDfQ6gAlLzDau45aYkFABRt+7KfMWtvP2QsahFP2wtna3o00jhQbdrD/AMk7HLegLA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795111151;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=iCZcK+Xk9vEKsk+p4nxjQUbosFq7NZ1ptOlpIIJy0po=;
	b=uAU+b18/mSqieMY7hpe1RaYmKQ2IhCRNSrV2dY/hFZGV2fJbvbffNbP4lWTq4Id3EbN6
	 lDgNYE+gfVL74lr9lhvbXhlCesXo3Lq1urrGlTmt7c8zsTKUSzRGO3xVCh3DwQsZPebrj
	 NNv7IaCX5fRKQCaBvZkDW3s8U/srpiYu2ECaqeWwfjSXP2sG/Ip/uozafdOJlV8yLd9Hl
	 Vix/akQwQdvfr3IuOV02Nq8nQZY+CdAJTOBjtKVwPlAq/zhb+K68ALwMWAGPTtE/KU8ld
	 RFuDXbyPyg6hyYF3rFwtFVri2yZQXTLzMEljrhius8hr3ShnPTpA8W/X+4suW50JLhg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=kernelriot.com;
	spf=pass smtp.mailfrom=kernelriot.com;
	dkim=pass header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=vM780bDg;
	arc=none smtp.remote-ip=74.208.142.49
Received: from mail.kernelriot.com (mail.kernelriot.com [74.208.142.49])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B45F9606A334;
	Thu, 19 Nov 2026 17:59:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B45F9606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=kernelriot.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=kernelriot.com header.i=@kernelriot.com header.a=rsa-sha256 header.s=kr2026 header.b=vM780bDg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernelriot.com;
	s=kr2026; t=1795111144;
	bh=xsVNIntK1rJNk6kiLRX09ac8CvYS2CGxELxLEhw8/2E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding:From;
	b=vM780bDgvP7sJiIA+q5wqHHmA3tP7bquxsKL/hA2VDi0Dyh4vGhEG6dwxpG4xUMg8
	 mnbZtRfY9IhGA+bUnVx3tS8mISD2Ecjgk01yzknZSh0hLm+/9FwA+jVt2JaF62jiIT
	 9lsVF4ZM+5kPCj2b8xbAPSRfRkArVxzdCvwMbRt6Aj8KY7wJsdL0pv958rMzcG40yi
	 mKl1cpc22q22P0KCOqtgrPsNcQxssRH2nfwUCiPKVpWmq9FAeXBnf5JtRS08wZSTVd
	 cbJePIAHH6SoQxeEKq7XqSx3MNI5IfVs1JXxozKEHoAr2kdb7psSiq8XDPWryCO7m4
	 rSe+bhdvuqAYA==
Received: by mail.kernelriot.com (Postfix, from userid 995)
	id 0E3F08D7D3; Thu, 19 Nov 2026 17:59:04 +0000 (UTC)
From: Magnus Leatti <magnusleatti@kernelriot.com>
To: Yao Zi <me@ziyao.cc>,
	Andrew Lunn <andrew@lunn.ch>
Cc: Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Giuseppe Nespolino <g.nespolino@gmail.com>,
	netdev@vger.kernel.org,
	linux-stm32@st-md-mailman.stormreply.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next 2/2] net: stmmac: dwmac-motorcomm: support Wake-on-LAN from S5
Date: Thu, 19 Nov 2026 14:58:22 -0300
Message-ID: <20261119175822.1033074-1-magnusleatti@kernelriot.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <avwr7G83tUvZ1HP2@pie>
References: <20261116091757.1656602-1-magnusleatti@kernelriot.com> <20261116091757.1656602-3-magnusleatti@kernelriot.com> <avscVrGbi7mFicuz@pie> <avsebFtnIASV-KpV@pie> <20261116164847.3432765-1-magnusleatti@kernelriot.com> <84566846-2ddd-471d-8f4f-068ef10f522d@lunn.ch> <avwr7G83tUvZ1HP2@pie>
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

Hi Yao and Andrew,

On Tue, Nov 17, 2026 at 10:26:52AM +0000, Yao Zi wrote:
> I think it's likely not BIOS setting this up, since the chip's behavior
> is the same when a reset is manually triggered, according to Magnus'
> test.

Fair: BIOS ran before my dump, but if I trigger SYS_RESET from Linux
with no driver, the chip behaves the same: OOB_WOL_CTRL_DIS clear,
GMAC_PMT = 3 (power_down | magic_pkt_en), eFuse MAC in filter 0,
WOL_CTRL_PKT_EN clear. No BIOS involvement, and v2 counts on that

Yao, on power failure: yup... it fails to wake. I tested it today with
the v2 module and "wol g", BIOS set to stay off when the power comes
back:

  power-off                 wake on the eFuse address
  power-off, cable out, in  stays off, no wake in 4 min of magic packets

So if power drops, it just won't wake until it's been shut down cleanly
through the driver again.

FWIW the vendor driver does the same: wakes after a normal power-off,
sleeps through everything after a power loss. So its the hardware and
not something a driver can fix.

Thank you both for your time! I will be sending V2 in the upcoming days.

Magnus
