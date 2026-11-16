Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794819871;
	b=KgpwSLTxJ4MdovWzlPY6aZIeJmBsbB3Tspo/LPZD4vqxGsdIg0BogOSEwarpXxbM0rS1
	 c6ddCA+6EsEMBDdtohzo7kYrnaVikEOGhlwTz9u9e1zc26T0Z8xjn2uND3uqRL0VuBNBj
	 7huHalyrcsv63TDilV2wSXIJ1sWCVFO2AJjX9piVw1VjGl6xlCMdIB1WH2GTkHqudFp3T
	 gvRRnlEZ6BTzFgVmq+vEBC2d82BlQYQoNHRI2uBcpIFoRsCt653KiHG7AqN6euR+l+s/8
	 9PiwM599KU1O2qLD8ktYU+yFDtiMeUJ6h9OU/sonyW2BwtEzPpYLpo+6Gv8B3ZicvrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794819871;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:From:
	 Content-Language:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=WyPsK1iObrDROZAGJ0P1ZBjLWJj9SOCV8oqzrE6Bv9Y=;
	b=DyGRnvITFzXWbSl33lyKyVROkyGBOH1Y+nkxm5lfRCukUDLoaeU2mzZ3RmcOEirTheG1
	 pOFQpeF3kaxbcltBRG1co2lAZiRhAPMhPoZWbxWNEnSPmVsCHhhbfbk5EKo2rJ2+uNXdK
	 7ZYjQhATTvKPXeHR0g27tc0I1/+WVLS3TVfvBOqBiYKrE5DpaG0JpqMkhe51d4Nz00xyK
	 xElvuKMThYlCdGK/TE/GJxkJHOJFkDklG8NcB3hadWDHgn1ywhOh/rA02ZwDfHVJUJzuU
	 SVCa0HVgSoCCCrnR9mBIhbqqyM26NVwP0UMvP62HDMbhjeiUHgXqolt2XKbWyH7FLLw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=XHJL8met;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7C1C1606A329
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:04:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 7C1C1606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=XHJL8met
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4bb66245c51so657275e9.0
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1794819870; x=1795424670; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=WyPsK1iObrDROZAGJ0P1ZBjLWJj9SOCV8oqzrE6Bv9Y=;
        b=XHJL8metE6vh0GlQjKnJHCFZZ9z6Lxjc+BBbYYp5w7ESej30ltDmvr2FydmuA+ZvRu
         s559RPBEhiNjyJP0RbryivsvgdcKgUi6FT1NFwTrynpqvHnnnAbK9NaaNVqEIdwAXE39
         4yI/bQhxd1IrUU9PHK81XwOyLpz1jSJARFnxnxla9NlrCTM/W0bTUxQOktLuugi4HIJQ
         RPT0cz7fq4K/4FGEHS3zWZdi2j5MvAZ5wdTo6/lP+qNLY7BvH8mj+ipVKXw+VsYpAXyM
         OMdMWrMCQbcR1tGx0GCVoSYm7RCrx3k4Cf0C/k8chEx12ZJic6P9bhXmJI0jCQPCNN/m
         r6hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794819870; x=1795424670;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=WyPsK1iObrDROZAGJ0P1ZBjLWJj9SOCV8oqzrE6Bv9Y=;
        b=ZwgilCgXXMmRP87wpJyx9TYk12KpMrCP0e/V7qfKrp+UzUj+0vDI+lx+IdEipzpvv6
         yh7BEfFrjRHszklIu+EBVxV0D/ELC1hBIlpbJBHkIURVuHV4j6+yzNFI2D+CVO33spLh
         FWrSJ1Nh5RlZJGBQrqugfC2n2TDxYob6C5cED+9aXpWtuTiayk2AnvNfPOelZhlVXOfO
         9yiBOa0EtKmqUjijiAXbnY0C5RorFl/6RiWTpnbK6icv9mLZFzP1rLG2c9F0oTTaNB70
         RjArqy3PaGA4umOyXWedZ2HkTYs6Db4hUp6OOr+oq5AV4DbTEpWRq0KX9Wx2JOxbv4YM
         dpjw==
X-Gm-Message-State: APuU4Z/djAjr0pJJz5+hBK/p6NCMTYPHhi14JGaY5pfPorDgT/vGesNX
	Q9zf5fQ/yLmSI7RbjCepKpL6QVyRQMQLLo9iJ3jdNyDZpEBTSM1DBWMq+Glt6csvZGM=
X-Gm-Gg: AYBFou3vZzbQR7/oNdMAL/3q8Pmvm/WA3wUyN4Fiyj64EmN7gGswzPTVHiCSw40LTWp
	oqn3032HlQtzZnuALAXU6wj1GdrmvxbOi9XTXCsmtwv9IoI7CEGyiFuZ7whD1ljlVodG2J6OCZI
	33avuUrLU/W87k+ICT3V0OerfXGXwdx9Q7eN1JuHw2JuL4fqzWezQArl1CnCKK1znA+FVeIQWg4
	zPiVaSl8AYfMthpjinm97b/yGMxgGdF7HiDp8s46XEFCmx1V0NF/SfkQbJg9Io1ci4pjXMrtFx4
	moEQ4xgBnyJU4RMhMuDrILROdrXUiVa9dEX//vSCHecxaFeefDj1N9Ye6Zi7D7v+6YGZn7vqsom
	eH707pIAKNW4Z7NrrzidtSBGs+BvBsAc7nkByrKXbP6P5TCJ41PZ0DjpokP0EjvL76ziQYewpk+
	gTtysPBIOv0pMMF/9+Kgx8q3ATvvWL39H4K20TVTXSQp46wjdEOJPMUalzNZumY9ys4jG0VOZAV
	LIAyhlbl7PVkTthIcRhSM7UYNc5NfTmjVykpyE9zvYSDWRLHoKIWUWp8AUreeThRBPh+zSGFRGV
	AV4B3fho2xuJnnoGaCQmAklZf/JMTWpOHxJ031Hgv64gWIahTSrAMOXlcm+D6nI1OvzcARFX28l
	yxiYJyQ==
X-Received: by 2002:a05:600c:6c4e:b0:4bb:68ed:a356 with SMTP id 5b1f17b1804b1-4bb68eda491mr65161595e9.1.1794819869714;
        Mon, 16 Nov 2026 01:04:29 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-49c81a63b1csm20157980f8f.4.2026.11.16.01.04.28
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 16 Nov 2026 01:04:29 -0800 (PST)
Message-ID: <e45eaa64-08e6-4ad4-845e-f844150f3542@6wind.com>
Date: Mon, 16 Nov 2026 10:04:28 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH] net: fix uninitialized heap leak in multicast address
 dumps
To: Henry Martin <bsdhenrymartin@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Yuyang Huang <sigefriedhyy@gmail.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org
References: <20261116024056.1274402-1-bsdhenrymartin@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261116024056.1274402-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 16/11/2026 à 03:40, Henry Martin a écrit :
> __hw_addr_create() allocates entries with kmalloc() and initializes
> only addr_len bytes of ha->addr. Dump paths emit entries using the
> current dev->addr_len, which can grow after the entry was created:
> tun's TUNSETLINK changes a device from ARPHRD_NONE (addr_len 0) to
> ARPHRD_IP6GRE (addr_len 16). Both the RTM_GETMULTICAST dump and
> /proc/net/dev_mcast then emit up to 16 bytes of never-written slab
> memory per entry.
> 
> This discloses leftover kernel heap contents to anyone reading those
> interfaces.
> 
> Zero the tail of ha->addr at creation time, so dumps can only emit
> initialized bytes.
> 
> Cc: stable@vger.kernel.org
> Fixes: a748ee242681 ("net: move address list functions to a separate file")
> Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
