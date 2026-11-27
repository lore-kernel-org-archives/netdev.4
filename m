Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795770699;
	b=tv398TNTjrSolFD/avJPHgs4DFcCdDD3zCrkfcSaXscY23zjjmIQ5HqbNhGvrp2nvAqa
	 HbbgyK3WMe42iQY1HArRwg1KHdNm/u5JAsy+zIJvJF0CVfIclWr40tYczqQivE6LZF7Jx
	 TLDWkiH6hP+Qpv6x4bsUXh4pjpfqgVgF0X7edoDd0So25HbGGrrkRKLNYuQEbLRpnSDQ/
	 +Q+5aMx2P+GQabpIaco4v9cojXG4/iODEI25bNFBNmKj5AjbSxRbCMaweXHHarxde3gvT
	 OKBclxHbjY8qY/ZC2tBq1bGcX1vLmWMEiCjp6BwAuvXR8701gRN/Pct2nSI1gPI5e9Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795770699;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aGmL05K1LldZsg+2x8czLa8BN0q4ZrDwGHvyThvJoes=;
	b=z4ZEb0Y037X8N2YcL1HJakyS+g/28Nm9wHyjzn6N/z6A7KKF21UFc1oB6TzrHvtEnPiR
	 QJjBp1AXcZpbT96zyqmlkAT0oiPFwUp1uP2Nj4SwL2ClHHEI8Mz+P2n7aGdBQ9InifKHg
	 QZ7DF/K06toG5+9DF6WAHIWrWGLXqifuACGy7R1fJKGHRiCvsQUIKQPx3KZS8kWMrwOVH
	 A3U0MM1JyMvbYr+8Max3FKsMKr7Wgs+Hg0Kj2XMwoF0kGPy3VgX+h47Uw6FSrx5nxadLe
	 eqpKK/c6u7DlKPWd9it9UlAoDa2EFHje/CgSBpBk4Md1qsPHKrs55y4m4sVnNrYAvUA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MrYdXZqm;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aaYgahXg;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B1BF606A31C
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 09:11:38 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3B1BF606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=MrYdXZqm;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=aaYgahXg
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795770698;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aGmL05K1LldZsg+2x8czLa8BN0q4ZrDwGHvyThvJoes=;
	b=MrYdXZqmEk4QvPE/e48yFSA7ctljCh1SIjyHtCs5eKJ3zDyCoCmLfzGZJxSxSVcJ5kXU6p
	QlcMoozScSktCEb2T02JhfZdFwp3GiRtW3O7jBn90bBMH1nP3GlT2/2PDxZutS2PjMqAeE
	A8aMLBQFItvjLbm1gBIztsaJM12w6CQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-540-l-AiwYPQPaucl8k9bD_7jQ-1; Fri, 27 Nov 2026 09:11:36 +0000
X-MC-Unique: l-AiwYPQPaucl8k9bD_7jQ-1
X-Mimecast-MFC-AGG-ID: l-AiwYPQPaucl8k9bD_7jQ_1795770695
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a370217dcfso7052008f8f.1
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 01:11:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795770695; x=1796375495; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aGmL05K1LldZsg+2x8czLa8BN0q4ZrDwGHvyThvJoes=;
        b=aaYgahXgyowRrU4Ja7LPQOfUElQvzN6OOekafaXbRdJlOsS24aEXbeqSJkUutl3Siq
         EN7IcsTEroI2UVidRf2ka+h1Y8cSW8QK/IUYdsAuSzbHC0Zx+3iDCyma4JBvgznO6nAq
         8l+NhGnjXivrE4wKS77WTUClHwpTbqFdYGdXOm+ROrNo/G8khfQNFp6WMIcZJKrTrhgv
         6iJhqgTonXqFI/sG9gtfYAF78sbyNx9TvVlbHT6VPqbDTKjpVXcxEdRwG4zsntmyYmpk
         uTEMUTjaUeSt6vHMYzNNytVBlstjUuSZ5Ib7oW1jzQWQIg7QrJeI5Xz14sna2GoW1yOA
         fr2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795770695; x=1796375495;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aGmL05K1LldZsg+2x8czLa8BN0q4ZrDwGHvyThvJoes=;
        b=ra3V7rdchG3A57mIgtSUjLP8LaF3bqARxVK+WX4n/WwxYN/Hg0KhwDLKngUQnltXiJ
         oQVXjQEPtQLWoKVgHw9D4XwOVxsA5HncUIGk0/qm1LoRxMrlxXJtzW/74Nh3NSAccZcq
         zz/O3wXNVaYU3rpiAqelSdTkH9bXkwhhJxo74foaKYXneBIbOgdtA+hG87Zk9d7wNbTf
         mFQ13bnpViijfvJi0PoJ9rHFQaQr/RBV9SXOHrFp2A22sF8FXzX4WJWpk6BooDvZA1qU
         2nWV0Ko//6ctMwFy6QA1ifY1088O74NFez8QFUJ05Mosq9YiwJy/NWwSISC87bwqPuOX
         rDyw==
X-Gm-Message-State: APuU4Z8mwtaQKL2ZMdprBdtNT+OflGgukE4XdYaHbsPGjIPwyEU2NWfQ
	PlvcvvGigRjB57xwtTasvLPLjxJVz2t9o2uAQAXSjkDZlvrbV73WGCS5/qPhQ4C+wG1GXo3zQHA
	tJ//n5DJqIGpRr0F5NUu4mbusfqEupdR4jZhlT7DZsu9rUvGucOUgbslsTQ==
X-Gm-Gg: AZFdTZdGBuVEMvxtytK1IYiHv2hee1nrnrSWatJF6oNeMxSvnHMPVH4baki08viYjUp
	Vi3aZaYzngEFkwli7fJlWrzV1/OIDmSZuX42SvkfWuR11C7lam7QvBClhPBJeak8pAPQQDlfr1g
	rPFMPcNjnZbnIe9ldIX8r/BKabjSS6+VLCIFkbIvb+0t7SBNP8AzAqw0a4DRxHwUuQmZy59ctg+
	KFoaT9f+9bskUVdu4fqHdgXMgpdUeIwEzqw2mZZ2Mvxl3qxMM/wGi4qzfoRji4xFE2cRen6cOC9
	DL90RiaY/G3kbGr2jgbM5Wlwh4cGRNxdbIEQwflxOB0GiTYX036p/MzeynOQTXOl64LXI0CuCqD
	U36USxPc4r3iXJy+0eu8RGhzZYTrGs/z58NSVYUwqG3tNQvSRFO3V2zku8pl2NW9JcQ89ecbM49
	GG04yFHE35DrsEEpE3ammTbmuXulP6ySjcBjJcg6knTGpB
X-Received: by 2002:a5d:5f4f:0:b0:4a7:35af:c83c with SMTP id ffacd0b85a97d-4abb3e21218mr45862909f8f.43.1795770695002;
        Fri, 27 Nov 2026 01:11:35 -0800 (PST)
X-Received: by 2002:a5d:5f4f:0:b0:4a7:35af:c83c with SMTP id ffacd0b85a97d-4abb3e21218mr45862867f8f.43.1795770694547;
        Fri, 27 Nov 2026 01:11:34 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989b3sm45914248f8f.51.2026.11.27.01.11.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 01:11:34 -0800 (PST)
Message-ID: <16d457c9-ff01-4ecb-9b50-1daa2be6a255@redhat.com>
Date: Fri, 27 Nov 2026 10:11:33 +0100
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
Subject: Re: [PATCH net] net: lan966x: fix disabling timestamping without PTP
 traps
To: Daniel Machon <daniel.machon@microchip.com>,
 Horatiu Vultur <horatiu.vultur@microchip.com>, UNGLinuxDriver@microchip.com,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Richard Cochran <richardcochran@gmail.com>
Cc: netdev@vger.kernel.org
References: <20261123-lan966x-ptp-del-trap-v1-1-3f46ca6072b2@microchip.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261123-lan966x-ptp-del-trap-v1-1-3f46ca6072b2@microchip.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 15:53, Daniel Machon wrote:
> lan966x_ptp_del_trap() looks up a PTP trap rule with vcap_get_rule() and
> removes the port from it, or deletes the rule when no other port needs
> it. The traps are removed whenever timestamping is configured with
> HWTSTAMP_FILTER_NONE.
> 
> Before this patch, every vcap_get_rule() error is returned as -EEXIST,
> including the -ENOENT for a trap rule that does not exist, so disabling
> timestamping on a port that has no traps installed fails. This breaks
> moving the hardware timestamp provider of a port from its PHY to the
> MAC.
> 
> Return 0 for -ENOENT, as there is nothing to remove. Pass any other
> error from vcap_get_rule() on, as the rule may still be installed with
> this port in its ingress port mask.
> 
> Triggered during test development, without kernel modifications, on a
> lan9668 board whose LAN8814 PHYs are the default timestamp provider:
> "ethtool --set-hwtimestamp-cfg <port> index <switch PHC> qualifier
> precise" failed with "File exists". With the fix the same command moves
> the provider to the MAC.
> 
> Fixes: 72df3489fb10 ("net: lan966x: Add ptp trap rules")
> Signed-off-by: Daniel Machon <daniel.machon@microchip.com>
IMHO this is borderline for net at this point of the cycle. Any strong
objection to move this one to net-next?

Thanks,

Paolo

