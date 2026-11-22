Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=54.38.221.178
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795374345;
	b=efQjBVwY4FGmPNrM3Cju1hvhjpD0sZRYNOfgi3oAgXsgJGL808/fwFMfrrnt/AQNKL4Q
	 P8PUe+YZrPqUryFJbHWBfsBgiluHHYGQjwdycc7PSrH51zSsMunufJ6W5z7OPLeWcTVxA
	 hFQx0Eo6YNvjwAKykm+Lu4P+7o2G9NIiIoX45NbvTfv6Wz6kPJuuDotD/L1G4jKI6xri7
	 +ICNHo8Nzwbs/DqotRLrWChgniA3XsfDvD2mRNDRClxFvN3FpQT1nIapcksmnfKrCL/3w
	 dCUiAADVeSsXWJiXRwkIp4i+dxUsXSHONIiJecAN+fmnNjkUqe9wayPuXnjpgRUHd7w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795374345;
	h=DMARC-Filter:DKIM-Signature:Received:From:To:Cc:Subject:Date:
	 Message-Id:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=Kuh9ZdaQwjJRHRQoV7geRmoFKKJhFeMcObDR7WNqR9U=;
	b=siiQMebdXxPk45Lp5Y9+AqrXte5sRn3Ps3raBRrFSrMlQ/V83Ud0uy+f7LtINUCGSAb6
	 QEhM57e67KHq1q1aGmZUYetualzk5h/LUCDkT8v0P4D90gIpXwJxC1A4eR7JNbYJTkrOe
	 A0iyNl0H6jFtuGfUCUlV4crtdEGVeh83ubSNCsulBkImfevOW1HxNWhCTfKpOYtaH+loq
	 nhFFYnWhgqKPyoQ9nzkjDLa2Fooi2nHYOs1+6vWu2Jxy37gAnVJDin0GOIVmJwlY8twB5
	 kp1sp0iDi3GF7aRXWpp2+yrHWMcmcEVOXSFMkoYsGUhTJ2YsFm0GTxx3UnD2VhRbZ0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=loljews.com;
	spf=pass smtp.mailfrom=loljews.com;
	dkim=pass header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=Ri3MV6fs;
	arc=none smtp.remote-ip=54.38.221.178
Received: from mnc015mcc432.ss7-reroute.local (unknown [54.38.221.178])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46CF1606A334
	for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 19:05:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 46CF1606A334
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=loljews.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=loljews.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=loljews.com header.i=@loljews.com header.a=rsa-sha256 header.s=mail header.b=Ri3MV6fs
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=loljews.com; s=mail;
	t=1795374333; bh=Kuh9ZdaQwjJRHRQoV7geRmoFKKJhFeMcObDR7WNqR9U=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=Ri3MV6fsltetSNCt6c+vo9XdSAhnuBa7dMI5guirknmZhAqtiRoONsUrqSc96M2Ob
	 5dcPprJEIOS4Sh1jreu8paTVEKCBTCeVtl2UX7/lJY3hM+rFBHdc5LwRVoueI/kcHd
	 SqjaROY2xIq7FpYfFwE4JcvEl49VnZCmbEVB8PN6onlgJLzq7YGHqFCxHNrZBWOYJg
	 XfHFBODVb9fYSRJrz/1PZPvUTtXv72xySRImwcvgNpjVT5oRSOoEsRLYTyTeDDXYqp
	 N34giIFrGvt30TBTWokrgdYlUBRzZnRKEcKCVjG1a/CJkmVmsrSdFVyyUwE10HH9Xw
	 NGf8vkXl7cq+g==
Received: from loljews.com (localhost [127.0.0.1])
	by postfix (Postfix) with ESMTP id A5AB527A34AE;
	Sun, 22 Nov 2026 21:05:33 +0200 (EET)
From: Sandeep Haemoon <sandeeph@loljews.com>
To: netdev@vger.kernel.org
Cc: Jakub Kicinski <kuba@kernel.org>, Felix Fietkau <nbd@nbd.name>, Lorenzo Bianconi <lorenzo@kernel.org>
Subject: Re: [PATCH net-next v7 0/3] net: ethernet: mtk_eth_soc: 9K jumbo frame support
Date: Sun, 22 Nov 2026 21:05:18 +0200
Message-Id: <patch-db1bbade1b6d0ed25afcb4f551133e85@loljews.com>
In-Reply-To: <20261121164714.5b0ae08f@kernel.org>
References: <patch-7d2c457e68de6b53b7348d1bdbeadcec@loljews.com> <20261121164714.5b0ae08f@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit

On Sat, Nov 21, 2026 at 04:47:14PM -0800, Jakub Kicinski wrote:
> Please use git send-email or b4 to send patches.
> You submitted patches with a date which looks 1 week old.

Right, thanks for pointing it out.  My sending helper copied the Date
from the format-patch output, which is the commit author date; the
series was rebased before this posting, so the mails carried dates from
the previous revision.  I have fixed it to stamp every mail with the
send time, and will use b4 or git send-email for the next revision.

