Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280254;
	b=ZRw16JSRzfAErCMjuI2+DFAXD8AFvQMJFgjrPL3Ym9/bG3Pe5mkZ3UsWG9xnqyju4jzt
	 BIDgu41QrDkJckguHNx3lkNARELYf5jH/cL6kLjdKM9WX02mwe83gJEvV7YMTgkkbd1GU
	 brnLXKA1tIPlVwfxRWzg+B2JmARc7eWKt3akYkmLiaawt3QyBBTWY5AzWdG4S/JQ5B6X0
	 pQxhPiHVAfgkz+2XR8onmvx3Y5pEMJYPw+sSQPirubPYICYuS1SzB07bH7JD+t0yTIVJi
	 3f9Pi6ZDW0oVPaCABn9eE92jkNUfQ8TflJlaLcP5eFKj0Oz8gAgZFOv2SFRbOhJcYtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280254;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=LXFMN0A5KMMIgyP36bowFYDX2PYKXarZkUD9AtYfP2M=;
	b=c01UNtiU0/Lxej/yuOZY9iy3K0SDY0NyJd2/OMt86bsX05KthYeuyexczfrEYZG2SItV
	 /iLWyFKdWpShM6UMpYvTUP2G6zsKNSbzQwXWAVCxFGUPcXZI/iDFrPkFPj4SugdnjhWiA
	 0VPED3RB9nhqcGggEl3eaXXPx32mYBRr7fTV/u9Xc9YNCviFUPKyScwxfGCKfIuvFoTAZ
	 Xaj+jWrEmPkPP5RNpUPd7CPALIkXWcl2dSCNGyCIMH/zPyJfBwymQu4k8t2nG1yn33rUq
	 vj8cMlQ+uVo3dhyuLmEGknx6aT5sB7BSfHhTmbEZTalOYmSw6CKx7jaTImb3aU/A9OA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=loyOvsNb;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 929A9606A332;
	Sat, 21 Nov 2026 16:57:33 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 929A9606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=loyOvsNb
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=LXFMN0A5KMMIgyP36bowFYDX2PYKXarZkUD9AtYfP2M=; b=loyOvsNbmPLRn5ehx6/BlR08Rk
	it9MPCgP6qPenwuGlFHo+VyTW52vmw+7L1O40gySi/qpqo0HqX+luPTwv4fD6wPj4eLZyzdcg333c
	z1IG4AFsSjEqSuok2XLpeh1C+/b1Zyquj0SwHPKlVxuDkdlwbW7EkdJ3TJ/0rtg8PHG4=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUoOj-000T6z-2I; Sat, 21 Nov 2026 17:57:09 +0100
Date: Sat, 21 Nov 2026 17:57:09 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Chukun Pan <amadeus@jmu.edu.cn>
Cc: Frank <Frank.Sae@motor-comm.com>, Paolo Abeni <pabeni@redhat.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Eric Dumazet <edumazet@kernel.org>,
	"David S . Miller" <davem@davemloft.net>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH v2 1/2] net: phy: motorcomm: add led_brightness_set for
 YT8521
Message-ID: <b8c387c7-f201-40d3-8f1b-3f8113ef6622@lunn.ch>
References: <20261120100001.1568757-1-amadeus@jmu.edu.cn>
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
In-Reply-To: <20261120100001.1568757-1-amadeus@jmu.edu.cn>

On Fri, Nov 20, 2026 at 06:00:00PM +0800, Chukun Pan wrote:
> Add support for manual brightness setting on YT8521/YT8531 PHY.
> Testing with on/off and heartbeat on the Radxa E20C (YT8531).

Did you test enabling a mode which uses the hardware to blink?

Sometimes you need to take it out of forced mode. It could be that any
value other than 0 in YT8521_LED0_CFG_REG does that, but there is
nothing i can see here which suggests that.

If 0 is forced, maybe add

#define YT8521_LED_FORCED 0

next to YT8521_LED_10_ON_EN ?

Please also take a read of:

https://www.kernel.org/doc/html/latest/process/maintainer-netdev.html

You need to set the subject line.

    Andrew

---
pw-bot: cr
