Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795430332;
	b=1uj9YN+klOgEh7Z1ZjAYmem1e/C2yT2/Acsbvf86uyLUoWKRQi8FrW6h3esaLgvhTwFw
	 i7osU+0seBu38dqitUBg+xkCzE4wnF3n1i+b6uqcJPakYTglQ7YTXtYzrOZAH6j7lqjN1
	 sdZoZOXUMYxcMu5o0jABNfCRQedug7ZxEy2EqzYoRSZHbrL3ZgXSrXbzwOcOGcxlCmK1M
	 BOZ19TEyqUa7dZwENDCLFUBohhCQlSIP8W9x+sN7sfy2ngl/RKaau/MWAfo67uv4nEwSX
	 iu/MS3/niu8UF/6TUykfte5ZjH5spI0C2tCleV3QpaD8bqQPVZ3bLbzWtSzu6w78RPQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795430332;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2vogCHTyzsPAWp62GPt/7NN1PGJX3oa0puEKi/CotX0=;
	b=b/XwtGaC9JQJ3/tqGI6sDswp15M5f2TGFP5gVHnHlX7sXFehAKFinoil7IW8Rmx6vene
	 k3UUIHHsnLagfZoDCwzXjfSTW3Fj+RdI9QBe/RIeOf/bHMAfxW6Cycaphfbbgkvo9bMgL
	 VQ3ukQz9ff8Y+W+ePYmIwnO2PokS05GbQuk1ck5fzvO2aWmqgpzCOmFgRwMXBcMLdLoZn
	 OHj+6muCymBZ+IgDLXRzc+LqakkDStKm6RPBIhf/M/y13ePx5nW5vve+IiwPMo+sChx/X
	 zHY1CXF499l/0nGalSZCwnphenRaxul14od3ZUZQcoFNFbxU9e2/bb9MM5k/LlgOGiA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BKGAqYE9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OOrOArhW;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07AAA606A336
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:38:51 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 07AAA606A336
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BKGAqYE9;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=OOrOArhW
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795430331;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2vogCHTyzsPAWp62GPt/7NN1PGJX3oa0puEKi/CotX0=;
	b=BKGAqYE9isy8xC+EX+MKAN9vOZiYD6bXnGkHZ/MAlPANZj9WsEN3Tp/gHD13HSOues6RsH
	npOnDFMGCjuehekF0Mzf4V6k3xmBZCFpUlccppr+/tS6Y+sBrP/ntM2vt+FdQeuNIRZOxg
	X449grfGUy/Y6mUT3JvKuIn/6O6C4mI=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-348-bVi4mwfKM-OF7v48_qNogg-1; Mon, 23 Nov 2026 10:38:48 +0000
X-MC-Unique: bVi4mwfKM-OF7v48_qNogg-1
X-Mimecast-MFC-AGG-ID: bVi4mwfKM-OF7v48_qNogg_1795430328
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-4ba078abd78so19396045e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:38:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795430327; x=1796035127; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=2vogCHTyzsPAWp62GPt/7NN1PGJX3oa0puEKi/CotX0=;
        b=OOrOArhWVwNcPbfRVmT6Y6fSaMbQZv4neHWc2dYRVLFU8oHOgXIAVp+CiqOa4JNFJL
         bF4/2GUTXQi51oxgnbW2R8f9kqHAP4ExNlTcwcmE3AzTChIhuouy8xNOKHMlYr2nj/a3
         qq6eRQwjv3fgl17/UQpf6iZfe7/HPfQudkn2B60A59SIhWHKYKLWh3GB8SEcQ/I7E1vP
         C2QZIiFCrO/ZA5lWXF8KKo63H6NIE/yMxY7ep9QEZMj9RzosogxJS9Posh09rKauf6lR
         ke/oJXt3EqTbfngGFuJYcL7VQ6Vb5/Y+HeFOX6VFS6IFPVUA7/H4cRyNHbkjNq4KabWH
         I8Dw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795430327; x=1796035127;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2vogCHTyzsPAWp62GPt/7NN1PGJX3oa0puEKi/CotX0=;
        b=Cs1XF9bfgF2vgoLE4uBTXLYnzN7YdqhpLQ8RGAqltzVsqox+7iylMX1pG//0obefsv
         FQ6lCf7ctU6s+tQIue7GKvFe1jSlcG9mruMUlmaDh6l773OUQsxiUAxuZpU1A04Bkeui
         YX7YoMSMn++3a2ZloqhvZtQQBbfSY35mQUn2NSmdWFFtuPUOQYsVcezNQgEKrm3Osejb
         Nwg4uTkXRpZmV9bxN8/PH+lS8g6UoXyNi5EAihnjgkfJRs/Oo46NTfipw50Rdyw2lTee
         qc/HsSm3r9xaHdlce2PjRlwEbc2fu0NgKzW1nc0Sd42MP7tI3GAYO0e/ZrKwFlusj08c
         8WYA==
X-Forwarded-Encrypted: i=1; AL+hErHsKLKG3Gn9q7knwzDl+K2977oI3hB3GHi0IypyNf49OfWzMXcVeKDdxD0UOuw6ptVLPO2OJKk=@vger.kernel.org
X-Gm-Message-State: APuU4Z86DcKMSE7JLvUrNh2BLvqgKCRIkxXKPYsfbEnlL0r5WGtnqNdg
	+xnjExh8tANk8l3ftIw2vIXo7SS9h9SCtMrs/8GKlmiDeovSnP31m9aBHlol4grCv3TPj+a4S74
	7pnJRZl0e6tI7sKq25v8sDQABjsqeJk0AW/X/p+W/hWJU2NvM0jL503oUcg==
X-Gm-Gg: AZFdTZcRO/58B/uKvpZFRay4A8e2Dsn/M4zNN6O/wAFwEDH3XhhNls1SSc9hhMYxLdA
	xcE5my35YaNBhd4g7TKaVwis56zzIquPqLUbj77CYOlg/hPOqK1qDCHdJjLW+U1g5WeCAOEEOYt
	FLdtHhbUALZnqRqDPwzgT8h6L7BWj0eXfUCGt3qw4BahG8sXZm/Ns306dRuaFSd+CaMUFFAq75z
	7tizeVosEdRm4p2lWKBYguYYmhToNxJJywzm2XfMQ8tRyTnwOBUMWkATvsF/5q7joTSelmkD1bG
	0h4OrvO2k8DiKHrZ6KNiGSZFoiIUuM769/OyN0kZlCKFolykwsluyG0BhNqgXgfBIORvSeFoY3K
	V4tw+v0XarAMrUji98T05nihrUrOwLXqsmLI+cjCvztI+5GZwDoYKgvA5w12NQ61igDprojwvM1
	lmCdm+qS4FFdmLr2L1WnoFn8NDsgp8a6wOCwGTt7eDhfPS
X-Received: by 2002:a05:6000:4009:b0:4ab:7c3:101 with SMTP id ffacd0b85a97d-4abb514617emr22984741f8f.22.1795430327639;
        Mon, 23 Nov 2026 02:38:47 -0800 (PST)
X-Received: by 2002:a05:6000:4009:b0:4ab:7c3:101 with SMTP id ffacd0b85a97d-4abb514617emr22984699f8f.22.1795430327225;
        Mon, 23 Nov 2026 02:38:47 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab658e2d55sm21654938f8f.5.2026.11.23.02.38.46
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:38:46 -0800 (PST)
Message-ID: <5691bcd9-1358-4f1d-b300-18a25a63eb31@redhat.com>
Date: Mon, 23 Nov 2026 11:38:45 +0100
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
Subject: Re: [PATCH net] net: hinic: Don't fail probe when firmware lacks
 rx-vlan-filter
To: Jinjie Ruan <ruanjinjie@huawei.com>, cai.huoqing@linux.dev,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261116021858.273519-1-ruanjinjie@huawei.com>
 <0e15bc66-3737-4e6e-92dd-3b54e95e224c@huawei.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <0e15bc66-3737-4e6e-92dd-3b54e95e224c@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 07:32, Jinjie Ruan wrote:
> Ping.
Please avoid this kind of communication, it just add load
on the ML, with no benefits for anyone.

Your patch:

https://patchwork.kernel.org/project/netdevbpf/patch/20261116021858.273519-1-ruanjinjie@huawei.com/

has unanswered 'high severity' feedback from sashiko and is
in 'Changes Requested' status. You should have replied to sashiko
long ago. A new revision is required.

/P


