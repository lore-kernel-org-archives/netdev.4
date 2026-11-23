Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446662;
	b=GftfROH2DI6NaSq9a9Xx8W+IvSUqJErntpJVQA8axwYm7vmQq/Hg20EaoS4c+nwiV69H
	 cvEdCkHZFRSp9+pMLGYgfeW4o1iTKe37B9Gqn5bIK800+5ipTeYtHpwAO99QNzO0txoCJ
	 qs++sRuYRKi6a1m/gFPEV/uwfDVfDtv7BbUio9/V0hEg4B1U11uWgTjUQ5TmrO48lQi8C
	 qhalshlH2rnfXgaAc6Q3/URyBHZg7ajZNHPho7aKD8TGfnwS0sBNFGGMo/ZEy/VkaWfLQ
	 ExN1O0AAAOmPHPHrhl34LCiQfjF/boHErPw9liAXaDL6LQRrDu/Ag7WqowWOJE0EFqQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446662;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=4D/pNtTn3K7Pquh1FRZ6xItg3AzYP2AHx7ViO6lbqj4=;
	b=SssCO1v6vkyhmBaCQ8Nn1hXRFByc9U6VZOHe2coEiSCPivWmXmWTBpqTz9wwAoXmZiFP
	 AVtigNYEQCN9luZ0NR+q0ckAbPTezQJKffpW0GlRQOIV2Zhs4QotSbMU1deW42owR8bul
	 L6kuYvKF56JxtjSoGIQ9mcR+ooE7XsZpUG09U8yKYLq+xEPZYka6OswYOtq/Trwroem8C
	 DgGcrh+jRV7bX/f75I7gVv7I6CK4yqUrlB/avRR+vOxHv/XwFLB868h0hTqdpz8vaS6s6
	 p7ZfAov8aJPFIHA5u3hT61wPUJnQKVxaSQ3XFefO7Oh7y9rNCjkO3P7FaXe6L4wWSiQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="II0cW/A5";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 303C3606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:11:02 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 303C3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=II0cW/A5
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=4D/pNtTn3K7Pquh1FRZ6xItg3AzYP2AHx7ViO6lbqj4=; b=II0cW/A5ihPuXaD7WA7mipn6T/
	xYDcBLLJE+qyZIyyKdzZ10WL6PEM+MlE4xPnVdtqtmRw3ST3tVFi4ZT/2CK6vla5b1eGq+ulqNhai
	4dP7JCI7qmO8nLZv8eC1ZwdG1sKLsxGXn2ftK8CJZOKYafP4nYhlmIlxEYVqp9eUh84w=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVVh6-000ofw-1z; Mon, 23 Nov 2026 16:11:00 +0100
Date: Mon, 23 Nov 2026 16:11:00 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Coia Prant <coiaprant@gmail.com>
Cc: netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	linux-rockchip@lists.infradead.org
Subject: Re: [PATCH net-next] net: pcs: xpcs-rk: use cleanup.h for
 platform_device reference
Message-ID: <814be8ca-6fe4-401a-af4e-206f1b67be74@lunn.ch>
References: <20261123123052.578956-2-coiaprant@gmail.com>
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
In-Reply-To: <20261123123052.578956-2-coiaprant@gmail.com>

On Mon, Nov 23, 2026 at 08:30:53PM +0800, Coia Prant wrote:
> Use the __free(platform_device_put) cleanup action to manage the
> platform_device reference obtained from of_find_device_by_node().
> 
> This removes the need for explicit put_device() calls on every failure
> path and at the end of the successful path, simplifying the function
> and reducing the chance of reference leaks or double puts.
> 
> Signed-off-by: Coia Prant <coiaprant@gmail.com>

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

Low level cleanup constructs (such as __free()) can be used when
building APIs and helpers, especially scoped iterators. However,
direct use of __free() within networking core and drivers is
discouraged.

    Andrew

---
pw-bot: cr
