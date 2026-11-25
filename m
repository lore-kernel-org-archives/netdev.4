Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795605627;
	b=ByxzrnJPprx53Ol8wmSY8HLbgzQ7BkYUbQ+EZK/3J/eymCH5UqfZpmyZg1djL210qjKl
	 lHp52NL4BNFEohKT2+xM4EWnHNiY0+znd0ybqe2pfl6Jr+hv54ZKISC+RvnqiDYyfIfeO
	 LGXlfgrqO7TReqplOPDqFL6+6KqWJ806uOVikfCk5Xaw0V8HVg6XPGNs4Sx7bSF5n3zhD
	 Z48LQQUQMhBHH9PLal4YLLr6wjPkeC9vdRfgQcqhIHwW2KiV30NGUPTGaoTBfgYa6HdFV
	 AWivF1JZO+j3QfgcmE0sbVXw8fPdWhJ730IZdareb6WyO6SbTO4Q0WyrFi6+DgAb3LA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795605627;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:X-Received:Received:Message-ID:
	 Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=/OU0PI8ciyVjraR4T19Cul10vgtOe6ygyMSUrcMCTI0=;
	b=rN1FSRrsRreGpnJbyh2Yq9EDgSwTYzqQtohcI9bc8kIsuhvY38WF/Ikc/BLmaXXoH6Cv
	 NO4hxlU1/9fjLT5yvbYNVVa6GuIx9tgQEuRorPfIfXuBfvqARZTNHucw1A0B4rERVlPmy
	 m6qaAwQBS4fHqXzyZ1/AfgO8n+5rl5kU/A7SH8NuZBrS91BE0towhzwRrHnVeaOAYsKsa
	 6ajVdbeqSQajiR1/WAXHTV7WPHsWKSinhTXxl9aIYEaBUcHJjz58z+wm55VRZ0o4+7vmI
	 O0wGm6qFfwhJRp2PvACP2DP8aKgfMLtMFMCcFoA63xZDIbInqgVOip7ZBJ4EA8Y2Azw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IYWlv2F5;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XLZ2kSEJ;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D3DAB606A329
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:20:26 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D3DAB606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IYWlv2F5;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=XLZ2kSEJ
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795605625;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=/OU0PI8ciyVjraR4T19Cul10vgtOe6ygyMSUrcMCTI0=;
	b=IYWlv2F5BwxqmTofVSz7YQqFYfjlPsWVUr2/9fiVee0GP100/5vA/Hfb5OguaH63OYRVsn
	pIYhFTDDNdxBRcHVgIODSZ4+eWC9zWYPmjjQvrnaYWzGJLqOpwuWQL/0ovDztx1fiiynI3
	9uSWLE1SxKC0sADMYQ9UHolyXgQE/XU=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-Gy6Rf69PPwGU8nABj4Na2A-1; Wed, 25 Nov 2026 11:20:23 +0000
X-MC-Unique: Gy6Rf69PPwGU8nABj4Na2A-1
X-Mimecast-MFC-AGG-ID: Gy6Rf69PPwGU8nABj4Na2A_1795605622
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-4b9f361d9b8so397434f8f.1
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:20:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795605622; x=1796210422; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=/OU0PI8ciyVjraR4T19Cul10vgtOe6ygyMSUrcMCTI0=;
        b=XLZ2kSEJruI5GD8L2ZcmRVo2suX0U6gqsHsw4W+Snn11KpFT0u2yuOXltCX3dosUXF
         WN2BxWMUToepJeKSe9IzhkdHilOH8cVx7O9aARtvD9MYximwv4gTIUs4pY0YEKFyozEE
         UbQg4Ko6+CwcJZDcbZsaas3ml4/zLKe4nYhn5nKAkmGrd0Nc4WZOFKME5HTxMLMxeJAu
         8r8xut5ydUEz0Zt3P/ntcHTDEfV7L9PyfI0oTAGv9MiYx5wXY8tKxa7xcrZYJoC+Sa0s
         gBGo4TlSiOExzgkOex4MKyb088KhpHOVb1guTI6IxSbBIYC/N6z+fB0DyhNUnUowNevq
         x0jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795605622; x=1796210422;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=/OU0PI8ciyVjraR4T19Cul10vgtOe6ygyMSUrcMCTI0=;
        b=Ji+MTXSmgMKCcKnQhzTSFr1nMXYG9j0g2VgKsm6oI1XtPlu86FcPmp1R02AZx2v3PI
         SqX/4pNixEW56PvBBYvpdLTNq/v9zkfdhKLsMNUMljPD/9+2XbS9K+zugLkwQVIlJVtW
         eHiFaeJTkW4hNHXpHGHEhPu7zHYA54zHfGrs+90MOwC9hyfkcIiXsZ8X7cxZDq8mFLc3
         BKiP3Izejxr3tgfjxTrUtyAJ+hHdpZnOIIVpQQESv2zlBBfRgWc/0DNLJM7NBEBsa73g
         0412+9ciJmy5nWI1U2eBsz4O5MAuQHt4mjz6f0sIL27K1B6nnu2tHquis38xnrJH8qJk
         +C9w==
X-Gm-Message-State: APuU4Z/QtD3ngDAfe6ksJNj0wTcNBQksHsFynSRlh4LZfeQmrCLLXiAG
	qEUoisItmk3f2CGMuhyarKbi140csYjGpAOOPYXmiU4drHh4llZKfGnirHg6Gqmxwq0pCanc0qM
	b5a6mte38bkzx8bIsZwZRRC5p1DXuKxEGJF6Xs8QtYawS+OAdNrPCEQpdgg==
X-Gm-Gg: AZFdTZdARnFdZI22pE9afw8OaCWtQe0nO4IyqEwbJL1GmOnN6anLsuVWNzA/GcjNbZ6
	DagQYkhZ8ZBWFbaLcaZqZ8q8/HKHk07b4m8TFXgD6YeNMMdOQlW4SjRmErAJTacIL08I5Vm+ozb
	l9oKy9coTGqkY8lRtWDK9guxMdiQmdqq3do+kv3/u7BiM8c+Gjvjd59xYeKFdPdvwK8GWpsM218
	3AWLDPXMEYxGpcpXK2TalX6SFtTMS6A1egcyR2DfAfcHZg4/erhZYdhjnl7jCrre9sGeM4mqwXE
	thRAcNpvaXn65n1HcufABliHqYyvOxRo2LYakcpI1trD16VTBoM6A1HwsiKa5g5wLUbiPs6GD11
	575vvX+zZItkHT2pWX/fLgCiYK5qBHjtK13AiN6q2PF8IQ43j+uEQKNR4u7ziZjZba+TziWTYPH
	MAVXwkx8TU/O3+mePVZvFq9nlMDEH1GSbP0+R/9UyDP3Xk
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr321271195e9.17.1795605622534;
        Wed, 25 Nov 2026 03:20:22 -0800 (PST)
X-Received: by 2002:a05:600c:638f:b0:4bb:6752:8400 with SMTP id 5b1f17b1804b1-4bb8881a2bbmr321270755e9.17.1795605622152;
        Wed, 25 Nov 2026 03:20:22 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a9846sm601076005e9.11.2026.11.25.03.20.21
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:20:21 -0800 (PST)
Message-ID: <5f93ca8c-fe7c-45ec-9b88-4817d1b6a543@redhat.com>
Date: Wed, 25 Nov 2026 12:20:20 +0100
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
Subject: Re: [PATCH net v3] ip_gre: fix stale header length after erspan
 version change
To: Henry Martin <bsdhenrymartin@gmail.com>, dsahern@kernel.org,
 idosch@nvidia.com, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, horms@kernel.org, yanhaishuang@cmss.chinamobile.com
Cc: netdev@vger.kernel.org, stable@vger.kernel.org
References: <20261125074617.629026-1-bsdhenrymartin@gmail.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261125074617.629026-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/25/26 08:46, Henry Martin wrote:
> @@ -1499,6 +1506,7 @@ static int erspan_changelink(struct net_device *dev, struct nlattr *tb[],
>   	struct ip_tunnel_parm_kern p;
>   	__u32 fwmark = t->fwmark;
>   	int err;
> +	int hlen;
>   
>   	if (!rtnl_dev_link_net_capable(dev, t->net))
>   		return -EPERM;
> @@ -1509,11 +1517,28 @@ static int erspan_changelink(struct net_device *dev, struct nlattr *tb[],
>   		return -EOPNOTSUPP;
>   	}
>   
> +	hlen = t->hlen;

This is weird. The patch is broken, but it compiles successfully
(on some slice of the CI) because the first chunk is applied without
fuzz in the wrong context. Still causes CI build issues:

https://netdev-ctrl.bots.linux.dev/logs/vmksft/net-dbg/results/926627/build/stderr

Minor nit: also reverse christmas tree order in the first chunk

/P

