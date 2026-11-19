Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795084912;
	b=t9JkvfHQtK17GRNqhJ7HxSGJzNFOJJoN1gXneH7IlTSgEHy9AsEGP+tEnIQjsrsidPEl
	 mE8b9IrtZF7f7SZHEawpexn7IhXAY9hYBJQZPSgvFoE1XhxTkP2rhvUlAM1fa9+EWbcYv
	 8qTVo9yHLTwUtKX/S8zzxMPMiv5wA86vCIq7BYWVHHxmm52zYQmi4LQbHykfBP72zquWM
	 Xop8KtJ8gyhosE24Oq56JsDvXNiJ14dedncN8kvNLdUqLf1k45mc0HfdELH1HxG13F8pB
	 B8ebBct+Plhj/ALQbstXaGdiaSeeBIJDXELESB+SktH9YqROSqQ6wtYQJA9JSSjDZog==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795084912;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
	b=hgwsqN5tuPtAZrk4cAJndVTSLLmYg7gWWo0yKyvvSvUqLahIXp/11fNTjioJXZ+P93Rd
	 WYZftKkVz9f6r6ljm8ZWTOB76nJC+VO1HMB9Jto32rik7CnFkoSKpWzdbY2M+3cvji7l0
	 w7wh6QwdI/wK27i4Z2taSC7MGEU2LrPnQ8GeMI4Ic8wfhhtie1IpmlnvlwuTCEzyS2Hdr
	 jw/FlWk/piVWoYUyrv42KhKG8zSQrJPDqCQ8a6tu64HTEAGtb+gQNjG71xa07rqgJT+Rj
	 8CKucrquwJoiVyw6Qyn70LTb4SMqGnBE8ldK6Qg1xPAENC/vb9k7W9eJAP2KDNEkKOw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wqf31zqC;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UQy2FZwM;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B1E8A606A335
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:41:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B1E8A606A335
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Wqf31zqC;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=UQy2FZwM
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795084910;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
	b=Wqf31zqCH7nnXFaczrAGwDg/JA+U96IdYChaGsL4J5W75Vj4pD3T8OxwXUiBvYa4rdvKd+
	UvUVkbr1ac7j6qGrVLAfw8UISyNhhdPd03Wqx+xwFMzwX11rotQZwq8GJhu+Wrr8ye4dlt
	DgwG/4CSuzJwXISvXdtmHppPhqZOFYI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-641-PpO31n2vP6CsHetsuFspXw-1; Thu, 19 Nov 2026 05:41:49 -0500
X-MC-Unique: PpO31n2vP6CsHetsuFspXw-1
X-Mimecast-MFC-AGG-ID: PpO31n2vP6CsHetsuFspXw_1795084908
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-4a647e776b4so1618562f8f.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 02:41:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795084908; x=1795689708; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
        b=UQy2FZwMZQHq2erosHbanHLjOrQFHdTU0ZxgcPV9p/SUftvKB8gJ3S7GTK+J1xYwGS
         8nLKhlMlICBXC1Z3/BKboZqqV99XVl6KZQ7r5G5Dtz4LuLF+nwR7ZRLwvyJ5V2fRV4BD
         /GLck89gmZQ6c5+LZsF/n8hZsEwfEyodOKNQ2legy2ShpVvjAZtiqCdmxVlcT1sKNG4g
         zkP/ugo4mJCsxOFZLAWlrn9nhb4QF2cR9Ca7SVjSQ8YMRnQhUHgIqQWPSq02h90JvNQ5
         0m5qAA7FtuFiaUZi51qET4iNfnEFUPQJMYu8eKcU9sMuyibVe2wt1mihU9ZZJYjqzvVx
         X2fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795084908; x=1795689708;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=h5gnvDpKTbCpj4T8Sh/mh+pY79fspdBewFbkHfm2FeQ=;
        b=tSJxsMbICCzNNpfgiKUROTyPxhNx1id8iV1BTNnE9IkTk0zYTxndjmXaJdGcKUIzh2
         DqiOO0zLtbp76I5DAbeaAKeP9rMi8c2Qof4HUkbiH5dLqxUa5eosqdxbJgzJhdo0P3ri
         HFc1sk6+lKl4iVLTyouK4G4tswJ6um+JUwZRy+fZmhcPPWenifXBbHfOgejS1w1Bc0DK
         GxWYBpCQR1xGcaGKPEmVigP/CjZnFcFv+y+XyqeGQTmXlqGX4eX60PMmGXQUeuQ80rHb
         +aehC8s6Va/C/Eou0vGOJbtLKDC4OTmKWy+4t/28ASnKCtKgRfcJv8uUX4/4zFdEjKkk
         JpMg==
X-Gm-Message-State: APuU4Z/Zop3F/4wbSvpcMLxNNImwh87bfUl60g1Hh16Kf/SH0ZZZIbO3
	Px9iSzj2wQQdKkiMH6lB7kW72zn9AtldHgfQQOuZIG47QNdu/aQPVgKSxqeLBUTW2H1n9ffpnk6
	ZEJ2zCGg6IPfesFiESxKD5M7uQdlc8/CbpJHQtt+SOjLqP9J2NVFx7E76Kg==
X-Gm-Gg: AZFdTZeMsFHlYB+7DxeUDqzB+tQnkNrwWtIEpzeNZPZ/Vn+KFgULa4GRzapyIhN3NtB
	KP2IlD+UGd7nwCYgV+EBphN/3yiolgD7VnbR8lb637JE/uaxfPCigs2ViN7PzIRSLmbZHTr78XA
	yPJfXEV3PIv7VqMC+odlJJrHOug4I6nAsaSkjY0WLq6M7fUAxm29Ka0itlf9uYeWQtzSJz9p9fx
	8PJXwEG6RR0wNsWYAo8t05mV/nV56Xtszyxzym22skE8yxnB9p8nsekbgHL78gl8xRAFRYkny9O
	kEoC1l0xT6IwwfvZSEMfm6y2d3U5rymfuVjF8YAUX3FHJdrq8QKEhdTIa4bEKo8eFB9P02WmJwD
	LfRPnuygomM+ckZPEONa8TbZr5qtC2MLHoZIkWkJQcFWVrob/Na3u7iR9zRn18wLcqWoA8UEOwA
	Ysj6qtGHuelLB5mYSlkCJVjyBh4fOdNMe/82x+/KfnLcxh
X-Received: by 2002:a05:6000:4908:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4a69f2f4192mr10315959f8f.32.1795084908101;
        Thu, 19 Nov 2026 02:41:48 -0800 (PST)
X-Received: by 2002:a05:6000:4908:b0:4a6:9f2f:414b with SMTP id ffacd0b85a97d-4a69f2f4192mr10315924f8f.32.1795084907691;
        Thu, 19 Nov 2026 02:41:47 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a656a28b8esm10196704f8f.50.2026.11.19.02.41.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 02:41:47 -0800 (PST)
Message-ID: <44ea3f0a-f992-4101-9cfc-bec1ebf6a3c3@redhat.com>
Date: Thu, 19 Nov 2026 11:41:45 +0100
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net] net: mdio: mux-meson-g12a: keep the MAC data path
 when switching MDIO
To: Igor Velkov <iav@iav.lv>, Andrew Lunn <andrew@lunn.ch>,
 Heiner Kallweit <hkallweit1@gmail.com>, Russell King
 <linux@armlinux.org.uk>, "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Neil Armstrong <neil.armstrong@linaro.org>,
 Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>,
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261115-g12a-mux-data-path-v1-1-011dad738698@iav.lv>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/15/26 20:22, Igor Velkov wrote:
> Switching the mux to the internal MDIO bus writes SMI_SRC_MAC together
> with USE_INTERNAL and RX_CLK_EPHY to ETH_PHY_CNTL2. The last two move the
> MAC data path and RX clock to the internal PHY. On boards whose MAC uses
> an external PHY, any access to the internal PHY stops reception until an
> access to the external bus switches the mux back.
> 
> phylib suspends and resumes the unattached internal PHY across system
> sleep. stmmac sets mac_managed_pm, and with Wake-on-LAN in the MAC
> phylink_resume() does not start the external PHY, so nothing switches
> the mux back. On ODROID-HC4 (RTL8211F), after suspend-to-RAM with WoL in
> the MAC and an RTC wakeup, ETH_PHY_CNTL2 stays at 0x260 and the MAC
> receives nothing while TX works.
> 
> With the MAC on the external PHY, SMI_SRC_MAC alone is enough to read
> the internal PHY ID (0x0180/0x3301) while RX keeps running; adding
> USE_INTERNAL or RX_CLK_EPHY stops RX.
> 
> Set the data path bits only when the MAC's phy-handle names a PHY on
> the internal bus. As in dwmac-rk, which reads phy-is-integrated from
> that node, the node phy-handle names decides; here it is the mux bus
> the PHY sits on.
> 
> Fixes: 7090425104db ("net: phy: add amlogic g12a mdio mux support")
> Signed-off-by: Igor Velkov <iav@iav.lv>
Not that this 'broken since introduction' H/W setup does not qualify
anymore as 'net' material. I'm applying this to 'net-next'

/P

