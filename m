Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795445800;
	b=OlKpc8vyu3ohp3wsGJgCV5s5AHHyXxjDc/yjtJFj1LESNmi71EaKwP275lhXUD5yHivq
	 /yh7apNwjI1NHaqK0ZLlLSs+UEyKj/3w2bZJzd98yS+lU/UKvRf+QiIc3oK6yBaNJ9ZeL
	 nrF1sI0LcPc+CIN4PAAXdb4yRi5ziCVZzr2PJ9QE0aUGrNHkAcjoZrOowunhsF9Nlh46D
	 6QlCSlvBfrdRcJPJsLqZ8fJ/5O4XuAK9/RsxErweyU/m+oma0ovDxkFZS3kT14DMIthnx
	 wLZh/7jesjOV29RWrtMR3xDKzs+DX06QzI0LfGJbbz3mBQwFL+uLlZVofnEahTUfhNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795445800;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=DYibWYchpnASkU5561AmFliNHkovabi9KclkupbYB0g=;
	b=3fkhKmyOfO8/RAOcuGqkldtdn3I7SrNseRQmWtmgRfW2fLubDSjT5CL7Osjbg9cJ07hF
	 nXd4cQowzJfn/3bXBea7ou0+V8tyA3PUH9lUK5WcwoZZjjpaKfy+8MFo3nGteMRNJd2vQ
	 sUTyP1wGNaKGWnTzeN03rNdYUmSViAh4j8MqyLxIYaJgepkmv6L9FqPn+CaZDKBKfvCN2
	 Xz6oUgc1+xsfWCqG8zzHKaMRTakWQQI5Q1As+j1jn5Zq+VGVCi+Vw7PEo4mujwS74DSSx
	 XuwfshCS4XttGJumgKnm5/S624cdapthyrws4xQouqxoQvuj1L1RZgUR0fc5B7b9aMA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=TkcoEFcy;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 68668606A683;
	Mon, 23 Nov 2026 14:56:40 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 68668606A683
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=TkcoEFcy
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=DYibWYchpnASkU5561AmFliNHkovabi9KclkupbYB0g=; b=TkcoEFcyvpoqptNTj3ceydWmQT
	il5NLWF3MaJs/jLQzFnFMI8Risv6X55XwMlDCjzivs3uMjFcaS8I/Zc0f2CIXT0h1V9K3x0UfDUPZ
	YmF7Wmd8iti0xI8cQ+fjc2mTn20n2wbcPkjlFJEsxEG4U1S0Bz+hPozkidugYfIM5Ask=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xVVSC-000oFf-1J; Mon, 23 Nov 2026 15:55:36 +0100
Date: Mon, 23 Nov 2026 15:55:36 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Linkui Xiao <xiaolinkui@126.com>
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
	kuba@kernel.org, pabeni@redhat.com, rosenp@gmail.com,
	jacob.e.keller@intel.com, daniel.machon@microchip.com,
	chunkeey@gmail.com, kees+treewide@kernel.org,
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
	xiaolinkui@kylinos.cn
Subject: Re: [PATCH net v2 2/2] net: ibm: emac: read the fixed-link status
 before adjusting the link
Message-ID: <e20245d2-f771-4708-89f3-46c9de1d2d81@lunn.ch>
References: <20261123093201.770552-1-xiaolinkui@126.com>
 <20261123093201.770552-3-xiaolinkui@126.com>
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
In-Reply-To: <20261123093201.770552-3-xiaolinkui@126.com>

>  			if (!of_phy_connect(ndev, np, &emac_adjust_link, 0,
> -					    dev->phy_mode)) {
> +					    dev->phy_mode))
> +				res = -EINVAL;
> +			else
> +				res = phy_read_status(ndev->phydev);

As i said in the comments to the previous version, this is wrong.

    Andrew

---
pw-bot: cr
