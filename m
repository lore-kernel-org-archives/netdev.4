Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795094912;
	b=e9kWyXOk6hA9cqX6f03H44UYOFiuLJSS2iKWpSaglf8hW6vTR7PYtcRZixjI6ogXg+hH
	 zfaWeqTSKina84NsHxdt1nL0plIvaFjQXJ3BLyG0u+krcKBDKgtwoguNINt98+ssDgKA2
	 FIwXB8vsqesks8oqRFe70XQWBml5ycMe4lGhuDQ2q5W4Zggf6wUzJexBsR/lImAoQRUM9
	 j+wPHlufpuccGc5G5y7LkwbdAGFOZ3en4nVudLH9/UvQny2gFl49z3FJFOk35VubXEzos
	 Vg88UwEV+YK1Wunzah2ZI3UG9achhCB557K3llaAOFsJ+pECaMLQ7jh87Vp2n3JJKtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795094912;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=XX66AsEBlWma6nQihcq3dQ5P/m5D2VpYewKrSqqQZH4=;
	b=A4pGo4Hw6/szBe91nXdee4GYboYPMMeBWZ4ZOXDLF/lXY0Wt5rLFQFk7S9nKk56E66Z0
	 +idHfS0cpI9jkhyN50HOghjoZBcNslXiVCOA4aNmiknOE2QCKkwbsjXmINxiMWF4eY1xt
	 QmkfotGo9u1AhRojyfrkmmqHWogXO8hy2gBHCFXQPuWHbQYWwe5+WzaEnmR2XyVYo6G7h
	 CqOK7bMeP3LGdQNxK4kd7bbXqNT+bGi/sLu/HjS10xRdd3No4juctUxhQ8kH+wXdVy2Hr
	 +LT+mVXfgi6W1VsXdAmCqjPwkbHpsZzPwBWughNUuu0fjrT+J+Uq90GXhnPPXolmTsA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=m3re8RXC;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AB2EC606AA52;
	Thu, 19 Nov 2026 13:28:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org AB2EC606AA52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=m3re8RXC
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=XX66AsEBlWma6nQihcq3dQ5P/m5D2VpYewKrSqqQZH4=; b=m3re8RXCq0c+3spcGNE/lvuehP
	FjjNyN+I/PP4QcCDGB7JXqdyF9OcQPw7TutyCmTbilpdoct4T8Mhc+tlPWy2IpFsH4/9tYhmKOOKG
	JCExAA4N/4oQS//0+/f1XLK6H2vz56mAcH9Vqb2LYmg9lRcF65CvGpwpMIRWa2Qwg4g4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xU2Bd-0002Sg-LW; Thu, 19 Nov 2026 14:28:25 +0100
Date: Thu, 19 Nov 2026 14:28:25 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kimberly Morris <gy770616@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Subject: Re: [PATCH net 0/2] net: phy: fix timestamping lifetime after probe
 failure
Message-ID: <ef959e01-aad3-4758-b604-8c94fde493a5@lunn.ch>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
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
Content-Disposition: inline
In-Reply-To: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>

On Wed, Nov 18, 2026 at 05:33:45AM -0500, Kimberly Morris wrote:
> Hello,
> 
> Following Greg's request for an applyable patch, this series addresses the
> automatic PHY probe-failure lifetime path from the earlier report. It does
> not rely on the root-only sysfs driver-unbind trigger.

This text is used as the merge commit message. So it should be kept
formal.

	Andrew
