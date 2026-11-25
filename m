Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=95.215.58.194
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795599990;
	b=4WWV+eiWW7UbhhRih+HZVG9oaA6Gcu6p7fTDD80AB3IAalgDWX/yNnyBIdnFGX3iYFDU
	 P9jpbJaGi+IFVlYUyzKn7jo8lUBiT6ggJ94BRa7TRtSiVmlGp2K7l1m2yi9ouVPG+MqC0
	 YweeGowED55xYWXiW/ZpPxpErA495pStZBVhZLPkJWJXVeUStrHad0omvZ/A0ylnBeyZt
	 9Xs9eg3OZ2ZbUPitNCPCRzOjczpOvFTqorxQCG4QYKBUmedi5fEyB50Q/yFwj2oW367IB
	 xgGT30SJ0ChiT89DBiwOZFT3yv4aZEbJW1me+mYozoAdw2eEg6C9ozFCzxuFTjT84cA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795599990;
	h=DMARC-Filter:X-Envelope-To:DKIM-Signature:X-Envelope-To:Received:
	 X-Mizu-Trace-ID:X-Migadu-Flow:Message-ID:Date:MIME-Version:User-Agent:
	 Subject:To:Cc:References:Content-Language:From:In-Reply-To:
	 Content-Type:Content-Transfer-Encoding;
	bh=OT5a/vqvbsaR8KSAlt0L0Kl4bCXvnuHxJ2dQQMulzN0=;
	b=wQ4rJ+ChtwfjucfEUMh/26trX5mzdiW3j/VOV2aO4MrjHnnuxMTA1ng/oIdy/TKfhDj2
	 83MH7d9xwejsSxWSOdbXUsUnosYJbjC7cz/SSqMYZAx3zlFL2piQLJX2Dcs8c2qy6MGxS
	 egjPQo5ys/rCRidiEhk280i4PfaHBHqyBs2iLM0ddTMbtsTVYtgg89W5LnTcFB0L6feiW
	 exaiEuBsukHcMMuyX/Y2Lo0M4sWqe0IMJch/jjVHh1a/NuMet5bK8Y1KicP1JYWTXPAJt
	 QTKd0kDB3snBdzCk5O7KF+oZ+MBrkviz7bgD9octUjevhrvbF0wnjYrJVCOd13RsRhw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linux.dev;
	spf=pass smtp.mailfrom=linux.dev;
	dkim=pass header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kbhRrZh9;
	arc=none smtp.remote-ip=95.215.58.194
Received: from mta1.migadu.com (out-194.mta1.migadu.com [95.215.58.194])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0ED5A606A31E
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:46:29 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0ED5A606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=linux.dev header.i=@linux.dev header.a=rsa-sha256 header.s=key1 header.b=kbhRrZh9
X-Envelope-To: netdev@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=01ys/YG56nsWVoCw20oIJbnm2s/GEu/YNu73h1gMbKY=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1795599988; v=1; x=1796204788;
 b=kbhRrZh9b5kOYigDHt3keeyXCOLfJ0N+9QCbBEKkdJD/nsO5y76sCXVYBvHXXdQKwRtgAPzH
 3XV/7YHYdTOnuyvY/rvyO/sDofqAgT86irL7O7cI9uSYZBJKTMu92UqZdKoTbc3XWgWpEXIFk9G
 pzYVVrmittHiUjwYkmXUBYE8=
X-Envelope-To: netdev@vger.kernel.org
Received: by smtp.migadu.com with ESMTPS id c6d2ddb4af64e76f;
	Wed, 25 Nov 2026 09:46:28 +0000
X-Mizu-Trace-ID: c6d2ddb4af64e76f
X-Migadu-Flow: FLOW_OUT
Message-ID: <5f977440-44ed-4a5f-946a-e7acf8007545@linux.dev>
Date: Wed, 25 Nov 2026 09:46:26 +0000
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
Subject: Re: [PATCH net v5 0/8] ptp: fix request serialization, teardown and
 SMA reporting
To: Ahmad Byagowi <ahmadexp@gmail.com>, netdev@vger.kernel.org
Cc: andrew@lunn.ch, arkadiusz.kubalewski@intel.com, arnd@arndb.de,
 davem@davemloft.net, edumazet@kernel.org, jiri@resnulli.us,
 john.stultz@linaro.org, jonathan.lemon@gmail.com, kuba@kernel.org,
 linux-kernel@vger.kernel.org, olteanv@gmail.com, pabeni@redhat.com,
 richardcochran@gmail.com, rmk+kernel@armlinux.org.uk
References: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
Content-Language: en-US
From: Vadim Fedorenko <vadim.fedorenko@linux.dev>
In-Reply-To: <20261123-timecard-common-v5-d669cfa034-0-ahmadexp@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 24/11/2026 04:42, Ahmad Byagowi wrote:
> This series fixes PTP request serialization and timestamp shutdown, and
> corrects OCP SMA/DPLL reporting. It is based on net at 4392bb809812.
> It contains no WiWi board support or LED driver changes.
> 
> The first two patches address prerequisites identified in v4 review:
> serialize all three sysfs enable callbacks with the ioctl paths, and
> prevent SJA1105 EXTTS disable from switching its shared pin to input.
> Patch 3 preserves Vadim's requested teardown design: after removing the
> user interfaces, send direct disable requests for each advertised EXTTS
> channel, followed by PPS. Do not use a pin-function helper for channel
> indices, alter pin assignments, or add a driver stopping flag or spinlock.
> 
> The remaining patches handle hardware selector values and combined input
> routes, recover disabled SMA state on bind, report disabled inputs as
> zero Hz, and correct the DCF77 and ART 10 MHz frequencies. Rebind recovery
> is now separate from DPLL reporting, with the earlier b2c4f0ac53f3 Fixes
> tag, so kernels without DPLL support can receive that correction.

I'm absolutely sure it's time to split this series into at least 2.
Fixes to core PTP/PHC subsystem and some fixes to ptp_ocp are not
related at all and must go in different series

[...]

> Ahmad Byagowi (8):
>    ptp: serialize sysfs requests with the ioctl paths
>    net: dsa: sja1105: leave the pin function unchanged on EXTTS disable
>    ptp: disable all timestamp channels after removing the user interfaces
>    ptp: ocp: handle hardware selectors and combined DPLL input routes
>    ptp: ocp: recover disabled SMA inputs when binding the driver
>    ptp: ocp: report zero frequency for disabled SMA inputs
>    ptp: ocp: correct the DCF output frequency
>    ptp: ocp: correct the ART 10 MHz input frequency
> 
>   drivers/net/dsa/sja1105/sja1105_ptp.c |  8 ++--
>   drivers/ptp/ptp_chardev.c             | 14 ++++---
>   drivers/ptp/ptp_ocp.c                 | 58 ++++++++++++++++++---------
>   drivers/ptp/ptp_sysfs.c               |  9 +++++
>   4 files changed, 62 insertions(+), 27 deletions(-)
---
pw-bot: cr


