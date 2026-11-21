Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795300177;
	b=mCqc0xm4Zug0WOyFn7vV+X/uW9n8Y7rifV6/TdSiHyXPDLsx1BZ1O9njHyz40wKEGoTD
	 6KKR+Uw8h8bStNCrcHPx1mBUaHX7LWliaVpFp/XOYnA+oaQo/Sk8FyBpSAVMUk13nP3WP
	 1IQQ5v9rhtGXJrEZarjgJFYws04s0wpTvs7XfGDyMgTBYD2R06Gw5MYMkT8bOw9+oZGRe
	 Da6irWuKs5CXi0MyMOs8gxoufY9AhWwqj2J/5yBz5KvKS/mYgtjD53xUJmYxLaUOPVCUI
	 ZGAyn7tILOG4dZWw+R7V/GQUjoLXIMan2dcDaBPJ7nfK9uLxWAP58dIMx3Hlo6ooamQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300177;
	h=Received:DKIM-Signature:Date:From:To:Cc:Subject:Message-ID:
	 In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=pfkmm5AWGs3hrHMN3eojrEaNT+h83XownnIu7ZRHz9s=;
	b=yl2xun5Bfp0NLbIgQmXUCYMuH62hyxVIMm5q89G9ChzHlOWz7zDJ6KdbB07E8MYn1fZ5
	 abRZnerBNLg3q8EYdENBo7EArUgseUXz2ZeDJvmgC9UhrFdkHdWMuS7j+FGGRNBhhg5sh
	 8/jcoEttTzAb2IpIibljCDvT+e/L+e1e/igfy24WOuNx/4t/Hbq+Eri8/udf/mr6rA422
	 cIp2RNh4g5UyQU8wdZMNO5XLausIbAdGVvGM5nzPQ9PV7B74TsLUt+cBE3v/gxHFmk4tU
	 XpbiqUWJByOb5KNYXy9nFKGBDd7L3sKmY3PYdw/TaOiTl+2vKMeNLWpNT25ExOcga0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQnuxuxT;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 911A6606A320;
	Sat, 21 Nov 2026 22:29:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=UQnuxuxT
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2E8A81F000C4;
	Sat, 21 Nov 2026 22:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795300177;
	bh=pfkmm5AWGs3hrHMN3eojrEaNT+h83XownnIu7ZRHz9s=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References;
	b=UQnuxuxTTYrcAIV119cFR1/DrInz3PSoUjL8CVs6MwidgmG415v9SnchrCXRjG9KN
	 Uozwb8FDYzTSI/ISMBLRVlhwbZesVR3XdfIuvL6xLbI1NyksepRJsgObGXldQiJ9SV
	 L6PaTtoiaAk3VkRgUDRuwDaNew1avvNVkF1sZL20CEHnAodU8bcTQ7t9mbzKBijwRT
	 v+v5u5fnQad7raUKFG/WfUuIkdNMa+HW6gCuBBIm2cxJdla9Gu7J09yGKXfdQx4W5b
	 MQop3JYuPD9ueRCErG9vyKJO7my/xiERpjzyVvw616jItO+dq6Ef4ebdTGqasgRIGf
	 09vM6i/hoRcIw==
Date: Sat, 21 Nov 2026 14:29:36 -0800
From: Jakub Kicinski <kuba@kernel.org>
To: Aibing Chen <chenaibing@cmss.chinamobile.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S . Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] net: ethernet: ti: netcp: fix queue name buffer
 size
Message-ID: <20261121142936.63af60c2@kernel.org>
In-Reply-To: <20261114103452.943-1-chenaibing@cmss.chinamobile.com>
References: <20261114103452.943-1-chenaibing@cmss.chinamobile.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 14 Nov 2026 18:34:52 +0800 Aibing Chen wrote:
> Building the driver with W=1 reports a -Wformat-truncation warning for
> each snprintf() that formats ndev->name, e.g. for "rx-pool-%s" the
> compiler warns that the %s directive may write up to 15 bytes into a
> region of size 8.

I don't see any such warning on gcc 16.2
-- 
pw-bot: reject
