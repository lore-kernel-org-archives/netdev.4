Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794938752;
	b=sNJte//sF6Qwo8/NWx81uzMJILHxachd69UMMNzLLeuXd0NJTq+0KSTnYAW37cW0bmT1
	 mUUEgGS4jTbzuA9ZwLQw3ABDir8lTe0hltMd2MMyla55TJJqDwz9vRDQ3wucMsX9UJWfJ
	 rDdLZhmTcs72kj7RV6dMsJwaE+1WRAawjg41vEyTK3DF0KgZ17nuPIC8uyMdR76OT9Sxs
	 M3EYrkZ8w1ldq4qYtw6PYejW9/cIjNvX4c8YZiH8+2PijcXukDauGD9YDhAusk3Xsh+/f
	 s9TyVvpxDzEJvzCMVLCJRAKF4RSXJ+szx9tBBHYAxM9UI0ZjX7NGy6UojvYezqVUMBQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794938752;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=nNTfQN2WoengZbD+BXY0CaTYtpF5bLo/3jNXNE74Cmg=;
	b=tbmEVwiL+6w3G8GGQUR2huuMd3IQPm7pibIKiC0Irrr4fZrFgGF3boK7Xxs7Pq31O0MR
	 1wJK7hPKf2HIFB2ese9aY2ZgOTSfzr/LyO8PtzZxiULx3GFZIPeayPokS4JkHuLm6t5DL
	 v1THbVdWUHI2GYRexRDIuzqF3kwTxtMkPCSPzpTpKE6uMsyUAACmQBnKMfUG18PNluBCp
	 xrGjW521LRySMkkI9exeo3dpq2AQX3/oHPRvwXYAoZlEYGO9GkV60ubHLAchF+I9x0eFz
	 JRttem+HidVrlbp5a0Soid9awxLJSMcr7KisPQ2jF0fsLric7v/tSrvUfAhwLz8eXpQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b="wxNa/zeN";
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CA420606A31C;
	Tue, 17 Nov 2026 18:05:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CA420606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=wxNa/zeN
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=nNTfQN2WoengZbD+BXY0CaTYtpF5bLo/3jNXNE74Cmg=; b=wxNa/zeNdpgw5Vm2AoMDMaUl+k
	y4y0UqXscB59zJiJl/siXlxEdMJDFQLUgcWKJn3kcF8OUx7ud38lXPPJUdM6mzS0KK1abBoJI2oEM
	rnmqmDeUJSXL77d/EplvqO8axBfO1yWK333jDPmtMCeFX+AKwMPeKkdwSmkyUBZ8y3Ss=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTNYg-00HEQB-OJ; Tue, 17 Nov 2026 19:05:30 +0100
Date: Tue, 17 Nov 2026 19:05:30 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Guangshuo Li <liguangshuo@mail.sdu.edu.cn>
Cc: Boon Khai Ng <boon.khai.ng@altera.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Michal Simek <michal.simek@amd.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH net 1/2] net: altera: Fix potential use-after-free on
 removal
Message-ID: <b8f3c9d0-47e6-4949-bb17-477f8a4e52c9@lunn.ch>
References: <20261117-571e631490-net-0@mail.sdu.edu.cn>
 <20261117-571e631490-net-1@mail.sdu.edu.cn>
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
In-Reply-To: <20261117-571e631490-net-1@mail.sdu.edu.cn>

> Fixes: bbd2190ce96d ("Altera TSE: Add main and header file for Altera Ethernet Driver")

The usual question: Does this bother anybody?

If not, net-next, no Fixes:

    Andrew

---
pw-bot: cr
