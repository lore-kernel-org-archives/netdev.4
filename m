Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795280930;
	b=badffzBe8dIa+P0hTceBassp8qAUnXvSKS3aTthrMe3f64H/6med6ADpiGm2llg2CChY
	 xFCaD7Xwx7t1unrQ/DcWt2mzJZVA938DrBcXu/soYE1LojZXqovf1qwb71ythl/1NU840
	 QKOxEqKAtTCwTAYgfmV+9jkvbeNPKzPhGkFLREMrpWgaVUmMmnc0OlWQfdwQsGkbyA1TR
	 PXGpF1yf51qVHL5gIUchLcUgFgnr4gpBIf9J9aqfebQ75qSaxc5nOA3I2nVvuVYG1bfDf
	 FRbJgCboKB00glieQhDfM38i7oxxvMasaNNd/u9sCB8M38yhnFPVaptNuiExoJYJVgA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795280930;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=UzM6iII939zbGnvM1qwB67oBXQdI8HGKQPoFNwcLmcQ=;
	b=WB+L8u5D9Ll7zwVVwCHytTB2JnBErx2vv4y17HIJNl71P3zQMhRowqkFgzFA9fVchpO7
	 J1iLpYIvRXGuwv6p0P5n0zTIRfAABY/QHnBwV6JbEkf7t1hv+DZGsOVTtEFLqgsHvcjZH
	 ik0JEydQACzvPYuG+UiRIRCf4dnyq8ztUovQ35TN+tEsSVkeL+mtdrmsJGazN4r9TUk7l
	 scu5NPS/mRnzRuXSKnQiFYuIewJXXHUcf8kNp7lRQe7uvKQUWOL8JytAT+45Qdp4dr0G4
	 Dcm5aX3tLg0oD83BCCAcDlWXeDwfI3jWl1mQc5vQWJSGuEL+sog8NfvE1slteMDqIpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=S3gQN2Nm;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71777606A320;
	Sat, 21 Nov 2026 17:08:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71777606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=S3gQN2Nm
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=UzM6iII939zbGnvM1qwB67oBXQdI8HGKQPoFNwcLmcQ=; b=S3gQN2NmqGp0KVCss3bUKoUVry
	4Y/tyKLVLTVhmCeaLN9AksxMHUnLUjWf2qsUZ4jtFIg8l/MK8zkhTXHs+Qm+GILByG8S20DIbi/zL
	myARsoaOv0pxmozuSJ9d9Xk0XsXDWavxADYRBPQiO46dTpDmpKL1OqHe3luuR9vF11Jc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xUoZu-000TDv-3W; Sat, 21 Nov 2026 18:08:42 +0100
Date: Sat, 21 Nov 2026 18:08:42 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Zhao Li <enderaoelyther@gmail.com>
Cc: Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Eric Woudstra <ericwouds@gmail.com>,
	=?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>,
	"Lucien . Jheng" <lucienzx159@gmail.com>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v2] net: phy: air_en8811h: check PBUS register
 read errors
Message-ID: <05fac33d-4793-49ae-b880-e3170f96f67c@lunn.ch>
References: <20261120062001.38233-1-enderaoelyther@gmail.com>
 <439bfedb-fc9f-4e41-a87d-f5e6a3b7950c@lunn.ch>
 <20261121122758.7136-1-enderaoelyther@gmail.com>
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
In-Reply-To: <20261121122758.7136-1-enderaoelyther@gmail.com>

> If the comment now looks misleading right above the mon3 read check, I
> can move it down above phydev_dbg() in a v3.

That would be good. Thanks

    Andrew

---
pw-bot: cr
