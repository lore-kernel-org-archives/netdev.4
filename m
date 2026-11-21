Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795244643;
	b=R6zelO8KMsadLCcU6bjIj3srBM1e6XLDzapljuJUPErG82P1shoLXZDVEGA/sXyCE2au
	 GI+OCFXWp4M/tnZERxwlxP1EcXw2sTaRQ7e4olfwOqw704LTF/8cUrwxRxun3eJohR6+Z
	 1ANNgrQ9vz/LQbJyoik/GdXlmuGcMrGttympgrtfN2hQMk9T51p3OFU0Jf96Enbnp+MHd
	 JBQvS/gVG4Vwp9roFctQkNTeZx8YNr633U3neJPPelwuXMbg+FSJFaTxscEIqWn9+nK1L
	 OkR3O0U5MTGUsnp3vW5vR5mR+XUzubWc0exF9akevI551yQkXWBfupEIJpZofiLI77Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795244643;
	h=Received:DKIM-Signature:Subject:From:To:Cc:Date:Message-ID:
	 In-Reply-To:References:X-sashiko-severity:Content-Type:
	 Content-Transfer-Encoding:MIME-Version;
	bh=ib1cVhC/gicU8Q7E4PlbGBhkmfSff8Izf/vgTL+7LIE=;
	b=EI8p8yDOLKhBA8gqgeUKI6uSLq8ME5rfeXdgmEx1ngVuEv3I1ZrCaj9DQhBlwUY2FmWV
	 r1V13Nx43wMatNCz82ZDGFRLkTI8IYZ++HMqH7ErO5I+cLzfryaBoXvfDggUGeN84Woow
	 CoWCbAnbp7aEibgvoEFrmUVPZRgH0kWt0OHS/46skMv17ld+b9kqqO9GpaasgHrmHY1Eu
	 ubr8bg2mHmUJsxFTxuv+M3lAzj8wwfkdn4eDDU9CFEjDzihI5mCo/qh0jRkfsYobDui5D
	 lDJqyXavxX2BkTNJFLQhh/bFXeuCQ3fqzTvZSJvNO42ul5gG26yBwOjKnsDg4hdw9rg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QspA9gdF;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2E26606A320;
	Sat, 21 Nov 2026 07:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=QspA9gdF
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C497B1F000C4;
	Sat, 21 Nov 2026 07:04:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795244643;
	bh=ib1cVhC/gicU8Q7E4PlbGBhkmfSff8Izf/vgTL+7LIE=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=QspA9gdFBgd7721Lu04WSUlmobPeVzacnre8GSQwekrR+A6aMqBsHPhR3FPlFkIY4
	 wVe120QesIPBq1IPa70Sbq2euDbb6Hn+KLBul53NXRC+Fqgvx4j7YcJFKq8XZNxN9Q
	 wpP6oioVdSNhzR+DP9tFmzYhiiaWakgXNCJIYSmCnA5V3nGMLuj3rkVu9MnCQyiynQ
	 RpPE8KaoH0kFEa7iSe04RmKermH0ONWB+d3yLY1iuJq1bZJfZs+lCOb72ACgvzP/ua
	 Oy9nX+JmIgXpL6wCTnW/0yQvODn5xuuXROKa4uKqiDTgKDUw+hl3y9ew9YQTVmqRNO
	 eQGLBDEBFUI0Q==
Subject: Re: [PATCH net v5 2/5] net: qualcomm: rmnet: Size the first device
 from the requested data format
From: netdev-bot+sashiko@kernel.org
To: subash.a.kasiviswanathan@oss.qualcomm.com
Cc: sean.tranchetti@oss.qualcomm.com, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Sat, 21 Nov 2026 07:04:02 +0000
Message-ID: <179524464231.3135.13518069516506821127@kernel.org>
In-Reply-To: <20261117060737.2764327-3-subash.a.kasiviswanathan@oss.qualcomm.com>
References: <20261117060737.2764327-3-subash.a.kasiviswanathan@oss.qualcomm.com>
X-sashiko-severity: Low
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The commit message understates what the patch changes.

--

net: qualcomm: rmnet: Size the first device from the requested data format

This commit moves the IFLA_RMNET_FLAGS merge in rmnet_newlink() so it
runs before rmnet_vnd_newlink(), and passes the resulting data format
down. The new device's MTU is then computed from the egress headroom of
the requested format, not from the format already stored in the port.

> net: qualcomm: rmnet: Size the first device from the requested data format
>
> rmnet_newlink() sizes the first rmnet device from the data format
> currently stored in the port, before the requested IFLA_RMNET_FLAGS
> have been applied. The MTU therefore does not match the egress header
> overhead of the format which ends up being used.

[Severity: Low]
This isn't a bug, but is the "first device" wording narrower than what
the patch does?

The reordering in rmnet_newlink() in
drivers/net/ethernet/qualcomm/rmnet/rmnet_config.c is not limited to the
case where port->nr_rmnet_devs == 0. Every newlink now merges
IFLA_RMNET_FLAGS into the local data_format first, then sizes its device
from it:

	err = rmnet_vnd_newlink(mux_id, dev, port, real_dev, ep, extack,
				data_format);

Before this patch, a second or later device on the same real_dev got its
initial MTU from the port-wide format left by the previous newlink.

After this patch, that device is sized from its own requested flags. If
no flags are given, it is sized from RMNET_FLAGS_INGRESS_DEAGGREGATION
alone. Its default MTU can therefore differ by the size of the checksum
header (no checksum vs CKSUMV4/V5).

The message also doesn't say that port->data_format is a single setting
for the whole port, and that every newlink overwrites it.

Could the subject and body say that every device created through
rmnet_newlink() is affected, not only the first one?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261117060737.2764327-1-subash.a.kasiviswanathan%40oss.qualcomm.com
