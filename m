Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=156.67.10.101
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795010723;
	b=clSPUhejFYQpLGv16EdyWoWoTE2i/dAvAL7MS0E6UsE2E9aDrSeaekkPmg/l8J7M0vlE
	 yvtENYs8MouImXJygzEPERuKU1persdsV/VUVHyC1dt4w4u6DGovrO2KDpwirJu+WMLYh
	 FKubWIiDfomzsrcngxz5idWbXTAAlqPnQaI8mI9rMuturZ2serh/LKbhd8Qla4ZKSnQWN
	 XyUYXOw9rlhW9+W11ijUfHaAWSV7abqZPVUx5R+Mh9llHtpJ9kisphYj9+tCYQTPfR5qZ
	 Z/j4Uk5hkr5l8Inmd2sk6w3FMHwaPW7fExgbwN+QFyGmb7KVAk7NlPQH7TKOC3s0PHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795010723;
	h=DMARC-Filter:DKIM-Signature:Received:Date:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=wXBRCx3UWzQUBpl8pUMlu2UyQcdFxWxzwFYPgkN4F2Y=;
	b=jWikm/MrbgtP9R8FNbONyMcWYHGbY86738PrUZ/ai0cWmiOYI8LdLkLTp+cGpsZZ9QlN
	 oWUoPvJHOlQRr/r4ct8vbfaHUvBK3Jofit23WRyfvzT1twEl7JLGlJCA2lODmzZ1NCQpQ
	 YcGRdgyT06CSBGkj/E/saIZ9NfVEBOiVBQ3ppY3WXu2/YoJLs9n8D2VKorUEIrFC3bYFY
	 3GefK+asDehjUjNBVwbpaVYKpdVBbJYXKT3h7PzUMhwVi8K86eJgkCh3yaYiZL3ayKFRD
	 EcUTdOShjY2Ez6l0zJxzeUP7JqGREybDolA4G4MirujTENiHRxaapTVbBU5nWzdMlpA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=lunn.ch;
	spf=pass smtp.mailfrom=lunn.ch;
	dkim=pass header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=m7qxHlLE;
	arc=none smtp.remote-ip=156.67.10.101
Received: from vps0.lunn.ch (vps0.lunn.ch [156.67.10.101])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4C4FC60A2604;
	Wed, 18 Nov 2026 14:05:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 4C4FC60A2604
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=lunn.ch
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=lunn.ch
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=lunn.ch header.i=@lunn.ch header.a=rsa-sha256 header.s=20171124 header.b=m7qxHlLE
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=wXBRCx3UWzQUBpl8pUMlu2UyQcdFxWxzwFYPgkN4F2Y=; b=m7qxHlLE7c4IXEtgYfX6ZMlqik
	OQEuZ6nBvnRA7i6vQ6bz5ghjpMqEC0BEyxX6R5+bz68Ivfjna2dNiqwPlcwAapY6rGdFQzVl2BS1e
	DdVi5Vq3uft87nKvXW/RUFfD7u5GQ2r09FbpzQl8oSjE26YXoLp52Ac0c9iwwo6UxAPc=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1xTgHi-00HQu3-BH; Wed, 18 Nov 2026 15:05:14 +0100
Date: Wed, 18 Nov 2026 15:05:14 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Kimberly Morris <gy770616@gmail.com>
Cc: hkallweit1@gmail.com, linux@armlinux.org.uk,
	florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, davem@davemloft.net,
	edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com,
	richardcochran@gmail.com, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, gregkh@linuxfoundation.org, w@1wt.eu
Subject: Re: [PATCH net 1/2] net: phy: restore timestamping state on probe
 failure
Message-ID: <5f05d3ce-014c-4b36-bc6c-395afb3baf6b@lunn.ch>
References: <CAD-64DdqQ=Vx4BaRn5TXz0g5ZC6rU9+e0o-rouyXzGH=Nv0ubQ@mail.gmail.com>
 <CAD-64Dfm-2U=1f3b7y3K-B3q_mijQ0xypqUEDt7o+q7Tmxx_hw@mail.gmail.com>
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
In-Reply-To: <CAD-64Dfm-2U=1f3b7y3K-B3q_mijQ0xypqUEDt7o+q7Tmxx_hw@mail.gmail.com>

> Fixes: 39db6be781cd ("net: phy: broadcom: Add PTP support for some
> Broadcom PHYs.")
> Cc: stable@vger.kernel.org

Does this bother anybody?

https://www.kernel.org/doc/html/latest/process/stable-kernel-rules.html

	Andrew
