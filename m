Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795516137;
	b=d0X0Zp701xd7dwuaiOyGV7kzbKPXER/RIgAU22Sm2MW2U3XjiWB/nVS4suPF+GYEAiTv
	 d6PUZJd5MYUJPK6AU3Z7HaK2lV2mMZfYgIFdR07bVDcASGOH78D1oU/64tSq936l29DTx
	 dw53It70Kd5lTHFfYkBF/mJLFUEINjfJeZt3E7hc8GYQ4vo3Z+sO8Wvvk7qu1UFI65XRI
	 sSXApUS0gFR1FnjHuSnE9Nkc26pB5YIkEE88C/5nK39iEGpj4/yN04wq0220blpjdUBFX
	 VcMmo5pIkyqMGh7UkgRT7WI9wXVQGLO+8A79cyiqa8YtnXnbBKwhWkVlFbhrZDpKp2w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795516137;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=YvVos/w2bO5cHdAxwgGtEk1DQ0vvOaudIAzQaAlwIIk=;
	b=FMBNuwm6KTb212dmeuqDqV8SDiCZvGKPv2wwzEluMM02QCuqZFupLNx/aKRUuvScqLBQ
	 o93tI3UdOv4VKLkkInJMYIjRVkYmxLri0R2LpBIG/DYJzT6H3yycI8M+GIqcqSWggYNEu
	 7OKGVxgK4XGkrL50T2R2lhIFAtT4ZR4mvLxKkCDwaxb6PJxGkaetJld5nisYC1iGN4oDU
	 IdVWqfDk3yF9EPsqz55RlmI7im0OTLbdHTq8NYBFKv83Yn+TnNOy8zt2Tunf4NXhHor2d
	 WE+ISjkWT+y7gVbTySv5f3G2BtQyn50WTEZi3dUprAkAGVPu+PHo/is9m5isDmD4epg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fyiLVbCk;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YI2xnQ12;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 336A0606A31E
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 10:28:57 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 336A0606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fyiLVbCk;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=YI2xnQ12
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795516136;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=YvVos/w2bO5cHdAxwgGtEk1DQ0vvOaudIAzQaAlwIIk=;
	b=fyiLVbCkAZOTac68aqdX6Mk6antexchdhFX8jGgxxNixtrWaySBmX+3L4y8GrxtAKbGDdL
	UiQ5zsG+erv33dL5iGRZ3Fa0wGKrdj/FgwQ6A6w8FaOwD9r0f2kqQh60p8lLYtVaZpjsa+
	eXkbKmXtNKccnc9aZVJptoFEO1ZxCNA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-173-wzG_BsfmMHejnC2hVbivtA-1; Tue, 24 Nov 2026 10:28:54 +0000
X-MC-Unique: wzG_BsfmMHejnC2hVbivtA-1
X-Mimecast-MFC-AGG-ID: wzG_BsfmMHejnC2hVbivtA_1795516133
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4a82fb7e71eso2417367f8f.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 02:28:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795516133; x=1796120933; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=YvVos/w2bO5cHdAxwgGtEk1DQ0vvOaudIAzQaAlwIIk=;
        b=YI2xnQ12auOqt+7nCCBXb8APJLJPOGIevpGDrGSOfQPMA4zXIiZNYtu8tJkmV1j9GU
         4tavdjFfV9wckOv4540cxESkynrrdrzIMI5ShDWMZbi06jSiM7qx9wRobcuAIECAuYjv
         aHTBHc7um6S58scG9vhv03QLrENSGYWjtWj+6C8OmBvWQ7Aby7HqKKVstLoaauZFkmOG
         AyzIVZNp7OEmJP18HsEeG/B3kWmY6UHMgmeyyZhfqXkjUgQdl/7HeSnL0RIIgLCuaZ13
         WuGBqnP/BjAz3Aza7btOoc+IhNJo6d7WbIkBPhcACRaTdNio/E0ZQlxBo0jPQHj+Gj2C
         z7Xg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795516133; x=1796120933;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=YvVos/w2bO5cHdAxwgGtEk1DQ0vvOaudIAzQaAlwIIk=;
        b=SZiQ4qBSBSQUfdnpmgY/q/VoMV5bAQv47Tu8CfcMLavjMGYpYg2bEQNzVdwryLTGWf
         IaDDiMtk82L7/02m6NowgOYXqpaDR/+mJdy3mDqbMj6v1gUa7A9lkJ8RBvG6vqPlP9Yq
         vzlQRjKKLgcVLZWg08nqfIAb/0tBdArGfPuD8ZBjysNsjop4ok5QSUKmWG+1ApBL2eNn
         JNYj/ruWkOHdUS0Akmfv2TF0qnuiXwYuY6i9N/Do/q+5My/Q/KIodFA/Kr9QDRv0/R9O
         Ymb798BWwX8vOTdfX5lITIG715eaHPCrObTc0KsF+XJfw0+FLkUTFpY58O+13ehaOlJl
         nzWQ==
X-Forwarded-Encrypted: i=1; AL+hErGjaXZICaXWZhNhFjr97yWd/yr/3xfPKvVZtT5kuRSF4/r7S1howN+SgzMcfQ8+f/6uN1/DoFo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vbGQ44dO4t6MJkvTh/lfcRCN/2qkwR6MKyaQung0AlP14HHQK
	TIPHKD/Nxh2uOgwrqR7bkr6B/nxlZdMZ5ngIglAOvDY5hR5/NYwEk5YrC5N1Ejx6E3x57AlT+qC
	KhO6nBWBbxlQZA47AaYyQ8RJrzSkYYLcRS65CtnZIqBjNLawxCHfB+M08Fg==
X-Gm-Gg: AZFdTZfYn4mMiahOKT1UnL3ooTXp+WZnqrMK8WnFMHE7Tu65MYGiSyyO3s95OlZx/EE
	gDOolKeXQNAsNSTq0CPrTt1vED7K/sCyjda7OF9f56YOBdAx2U6V5pwIOuogYUbVUre/oqLDQoS
	0/J2UAQ9tvjOr8husPxI4c6AQi+nLezqkLJDwIlD2FVsrwPr5anyrkIf6Ax59xJMcX5SdjMy6np
	gxLqoGihuozDp7rSRbtorDmUuk3ZwbH8dhtu38BLUj3fd16SH6QxIOSC2EgMIiTvsi6rWeyIDp+
	Ba/xDQqpixXDqwnozuKWsor+KYNLuSiqi4/5SLEEsNrZQ9SXSZyC0aeSqemv1pfa2bySwJ0VOQu
	F9UrQxoAgZ7Rnv0j0txtNDtp/99UveET0l+NxGtvHcNFUePzaZQPygd8v1owt2m+zZvSm6iKgne
	byc3tdic8YZo+x2dYR59t7o64nD5TUoUHQnGaw/WaMLdO/
X-Received: by 2002:a05:6000:490f:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4abb47b242fmr27035660f8f.22.1795516133369;
        Tue, 24 Nov 2026 02:28:53 -0800 (PST)
X-Received: by 2002:a05:6000:490f:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4abb47b242fmr27035607f8f.22.1795516133023;
        Tue, 24 Nov 2026 02:28:53 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm27405743f8f.5.2026.11.24.02.28.51
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 02:28:52 -0800 (PST)
Message-ID: <ca4c7d17-681a-4d28-a4a4-eea6f123fd9d@redhat.com>
Date: Tue, 24 Nov 2026 11:28:51 +0100
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
Subject: Re: [pull-request] mlx5-next updates 2026-11-19
To: Tariq Toukan <tariqt@nvidia.com>, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, netdev@vger.kernel.org
Cc: Chris Mi <cmi@nvidia.com>, Edward Srouji <edwards@nvidia.com>,
 Gal Pressman <gal@nvidia.com>, Jason Gunthorpe <jgg@ziepe.ca>,
 Leon Romanovsky <leon@kernel.org>, open list <linux-kernel@vger.kernel.org>,
 linux-rdma@vger.kernel.org, Mark Bloch <markb@mellanox.com>,
 Mark Bloch <mbloch@nvidia.com>, Michael Gur <michaelgur@nvidia.com>,
 Moshe Shemesh <moshe@nvidia.com>, Parav Pandit <parav@nvidia.com>,
 Patrisious Haddad <phaddad@nvidia.com>, Saeed Mahameed <saeedm@nvidia.com>,
 Shay Drori <shayd@nvidia.com>, Yishai Hadas <yishaih@mellanox.com>
References: <20261119121123.2211400-1-tariqt@nvidia.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119121123.2211400-1-tariqt@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 13:11, Tariq Toukan wrote:
> The following pull-request contains common mlx5 updates
> for your *net-next* tree.
> Please pull and let me know of any problem.
Next time please co-post the whole patches with the PR, so that the series
can go though clashiko.

I manually run my local instance on this PR, and it looks sane, but this is
really a one-off thing.

/P

