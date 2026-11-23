Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795446157;
	b=fKXb0n9i4L2ENlLPxZDHvL182XZMx+Uw9gOsVfQKfZBJxuOwif+46P2aGCeE0+Y9zb0A
	 jv3Npmh9ENZkjNo4B6SRiAL0KyFN6TiI1P0M0hef3G1+MDMcGBtUi/NIYkdei+gCsXgrd
	 kkTEJamAqUXji44u9Hn2lxniHQGgTyvKkglFtaYy/LxdK9Y4JSYjdI1QSIOcmYzfAgFb6
	 odA0SIMIf6j85Sa7+iCF4FAAabQJNl/1WhZ7sAt41O+E/ITeOek5hZAYcztp+7PemCxjU
	 vFpvXAyDNWq1ug0inB+PbTcYUV0BlEVOIK4+rBzuILQAFYGezsEih5FoUOhLmkOcYKQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795446157;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=M8fAFgMA6Yg4YabTx+UAo89Z8CGbAn9HYyco+eim90Q=;
	b=B1SlxapqwK9fa4hTjpqSvFm3hG/JqO1LhBI1gE5+ZEfKvNXeRMIZboiijoF4MH7z6eVM
	 zAlrXo27tQOMceR+Xuzq+8FIAUQLLKrZgYdhvkJvC0JsfYVboBWP6DJJO9q10x5+9CgfT
	 I5M6qZ2WayEO5oV/0rt+lQKdbtei8O15m4uP5p6laTT3Ytaqw98dD52OwhKy6HCpEjmqH
	 EzzR/FEIomVkZl9sBUgAffBrIyjxwh5IZw4iRezUGT59pPGXDXmXNgFrUVAa6Z5OYZuBM
	 FEfFF6LpAWDmlj4JlUJwhu0UnHc3B+3oEgdMXd/IfApO+Ou1m0DzRyi7lKfsugVwniQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=MnJo6lMR;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ECD02606A321
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 15:02:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ECD02606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=MnJo6lMR
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=M8fAFgMA6Yg4YabTx+UAo89Z8CGbAn9HYyco+eim90Q=; b=MnJo6lMR98aSCVPj8m+Gfa/M0e
	iees1R/gIfFUlb6K0ym8SeKX6R6U/wSWXzUDsNpOhat1NLAgdhHa2x9G1g9wyV73Qy4AaFvKZv4z7
	uKaRgKTsTpmgUljy5EgUTgi2Ru6UXX4P+4NmYgB8FY4OCfXjFKeuZ+jFqDGLj/9NH0Hk=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVVYp-000oWR-Ek; Mon, 23 Nov 2026 16:02:27 +0100
Date: Mon, 23 Nov 2026 16:02:27 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: b.lane130@outlook.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, netdev@vger.kernel.org
Subject: Re: [PATCH net] net: octeon_mgmt: Add cleanup operations for
 octeon_mgmt_init_phy()
Message-ID: <1cb2024c-45c8-4a40-830b-c4e29b414b00@lunn.ch>
References: <BN8PR06MB61774294C2C7961C2D8A4923A4452@BN8PR06MB6177.namprd06.prod.outlook.com>
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
In-Reply-To: <BN8PR06MB61774294C2C7961C2D8A4923A4452@BN8PR06MB6177.namprd06.prod.outlook.com>

On Mon, Nov 23, 2026 at 06:30:22PM +0800, b.lane130@outlook.com wrote:
> From: Bruce Lane <b.lane130@outlook.com>
> 
> The error path in octeon_mgmt_open() misses the cleanup
> operations for octeon_mgmt_init_phy() if request_irq()
> fails. Add an error label and the corresponding cleanup
> functions.
> 
> Fixes: eeae05aa2169 ("netdev: octeon_mgmt: Add support for 1Gig ports.")

Who does this bother?

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html


    Andrew

---
pw-bot: cr
