Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795435127;
	b=05NvYaaXV/ZsqSncGGz84qIyX670DbnW2sTVWmrEilfENmiOVucfnrM4TccY1sdChS+W
	 kzMCCfHOPC/UeIXdoPxLre9P650hBMt5Q3jujq66jYXXapL61ER5MSXcI04k0AdImHvqr
	 bM7eMZJd9K6KYUWaopbP/DPTAdl1r33kN5ubXkhGyy1Fv7EB6F7yFPwsJcfXaSfFV5QC2
	 JrA3FvM0V/mlu9gN0+41GiB3cB27ORfIp+FZYns8vllrwxi0YZQHr/y8j4nTXlxRgPZ2x
	 oHHBUy9q55JO+OqCAkGRcu0vWEw0oBdw2apEFyMwOoS1uh7fP7ZuOB+tbTGO9kHZDIQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795435127;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=CQFmq1pcPFYCkE6jKPYZE7YR7p9AbOoikjbaytK0pAI=;
	b=BMo710hJudIPRQ+Ldbom9eyi9Jeo8fQuZUQE/BeAfcMrMaAjA0GaJ+CdyoADz8I+3gEO
	 v2E+eshM/tRjCT638xym8A+xSptKQTtUEgKgMzKciQdI+36jPtkY2zp2txE0J5naSoyfn
	 q/jT9CCkWQ1K0G6J1YJ58TBaZfG9boE/50bTptuo00mNoMYv2Uq49zp30mRMDuduPm/X6
	 TeY9qHE+TqrvEefwLbR8surqwezY7lTZY73CzrKzYUI3b+q9uXYd9rE/e/zVQc1hrDhRP
	 SdoBwlOzQXeca36fgGkfQF6YIzL1qQOF7vcA/23Wwk1HBiQxstXcE1/oNoemSRWFBSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bT4u0Tv3;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=q8TvksT7;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 41880606A33E
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 11:58:46 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 41880606A33E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=bT4u0Tv3;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=q8TvksT7
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795435126;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CQFmq1pcPFYCkE6jKPYZE7YR7p9AbOoikjbaytK0pAI=;
	b=bT4u0Tv3CPi6x2xeOnlmhmnf7E+HrQXHrGm6taiSFbmnDMA12Tf8Asgnoo10EtxFDUf0u3
	YNWZFDA5OlPJkILZjN97W96bYccFR7PMS5qLkSbA2fXnsg0pvNde6of9J2p+WJnRViVaMe
	PbcLWKPYg8J2ZLnycV9yY/BrakXpIJY=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-510-Vid_hdPYN-6AwCz2KtRL9Q-1; Mon, 23 Nov 2026 11:58:42 +0000
X-MC-Unique: Vid_hdPYN-6AwCz2KtRL9Q-1
X-Mimecast-MFC-AGG-ID: Vid_hdPYN-6AwCz2KtRL9Q_1795435121
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4aa0500c979so1984747f8f.2
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 03:58:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795435121; x=1796039921; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CQFmq1pcPFYCkE6jKPYZE7YR7p9AbOoikjbaytK0pAI=;
        b=q8TvksT7v+CwaSNg6yS0Ed+NoDfkvAKLjmmEv1N6E+Ohw/DzECgpHU/dhfU0sdnuEB
         GH7KNmXRPUHXc5e68qXSP8cqyHF3XOj5wjU7pbkLvgCw0e+kcwkoEkYxpH2Zug+m/sHu
         dVOOVUoSeobuB+fj1j3Fl8viG4yqaJoaB7OCwD547OI7b0jQj5BK5TwuOauxVLFsuj12
         o+p+x8xr3y5Qv175Vg4ag4CkJvDPS19ioV48IY7bGhucRGecgMcWDrGTtIyaJdLeI/I3
         s9HULmRI2IyWBl13ki4YeM2X1DP1Gg0vgBJjNONDTetVN+f52hj8vycFuKePFzj1uAK7
         NP8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795435121; x=1796039921;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=CQFmq1pcPFYCkE6jKPYZE7YR7p9AbOoikjbaytK0pAI=;
        b=w0daJ0/icPzcE43nJ0ir45dwM8wzbkgq72A1IlsTROhmgKHqCwoPNTXU523ceCD+L7
         TTVi+jq8bEE4/Oobb3ZW6V5a3erEaV1KkvWNX0XRXN0xeIlXGdd0WdkHoVaRiwtV+StH
         t3yV5aIQLlkEXDKX8mU2vwmdlsLX8L3DflKtbe5X854aNs1t2bx3uxpxhAw+zmL0fcHj
         +qBCR01SS4YpTrAPb7vu7o4C0YvWXe0DTWHzW7er3W23eMdQZFRTG6+hNrU610PF19QY
         gfMpVdSl8mPKByYsP2A5ruFkAuwrUG7tVN5SpYbn4hxoAUDpKxMgp8dNa0+9JNvhC2Lq
         zK7w==
X-Forwarded-Encrypted: i=1; AL+hErFrqhRQFqMspmYfbzbfsj1loRbI1wZoGICpsZPWWzUHaedn56JUsFDYmxVH5Evw/obLSu2zDNk=@vger.kernel.org
X-Gm-Message-State: APuU4Z/h8YFeBAD7LZHpeBhCbkMp24lT5hBPT1Yn5LxzwNixDcPpzF9g
	qd7T/XKff+50FLcNj5DnzznnUtcxigv/Z2zIlx41OhWDEi2iltQ6q0CjWY2/R6S+CNUQSrNrBv1
	TEgj4HkmNHV0OEHIeDWgzlMI78fUP+TrbLTmQr3CpSC1yDAOtPdvvZ/7PAw==
X-Gm-Gg: AZFdTZeuaLD7+7g8nUQlh14uH3oA+8QafBzUbhNg1YQwDT2EqZv4m037OwV+keC7RZF
	BZk9ONthB1c5b4KM1Z2BVnKU5n1cU3yBe0epyfj3x8HErT05gGisuIjRL7rAWqK4+h5bqZDsJof
	yZrhOgjY5/lDTj6r41rTs6G1rOJeKG4Q0Tx+yHvh4E4VRqHhmza2iOxXF4qFdSRnIkEY5o9wJEo
	4VCIA856D9gGSwfs6xeMY2JRscru2HsOnjxOETzrI3PBadg6GcnZhuwNjUmh0wla2YaUMBOgMrO
	LDhIuJzcOQO9n92CoH5IEYvbe3QT8+6PpmWfLkHWEIohexVjM/dSsAzh0F1+jGvMA/8r21T1zNo
	KZi+gFYMlaDRQuXoS/Rapt80pv8YTTZd9XmFZOO+DA4gv2Zmgx3cnK5rDuw0Wr70nMINHlhvsqn
	DAY7o2viTLP01HOWKuM3oIh3kqCDgcS+dKJJBdRPg9PbsY
X-Received: by 2002:a5d:5f85:0:b0:4a7:1613:7206 with SMTP id ffacd0b85a97d-4abb57f7b6fmr21998997f8f.47.1795435121071;
        Mon, 23 Nov 2026 03:58:41 -0800 (PST)
X-Received: by 2002:a5d:5f85:0:b0:4a7:1613:7206 with SMTP id ffacd0b85a97d-4abb57f7b6fmr21998958f8f.47.1795435120674;
        Mon, 23 Nov 2026 03:58:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6b10b2c9sm22672307f8f.31.2026.11.23.03.58.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 03:58:40 -0800 (PST)
Message-ID: <12a2b44d-3d24-4b77-9dd5-24361d5fe910@redhat.com>
Date: Mon, 23 Nov 2026 12:58:38 +0100
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
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can reach
 the device
To: Stefano Garzarella <sgarzare@redhat.com>,
 Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin"
 <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>,
 =?UTF-8?Q?Eugenio_P=C3=A9rez?= <eperezma@redhat.com>,
 Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 kvm@vger.kernel.org, virtualization@lists.linux.dev, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
 <awQJo8WE5Gn4nYHp@sgarzare-redhat>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <awQJo8WE5Gn4nYHp@sgarzare-redhat>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/23/26 10:43, Stefano Garzarella wrote:
> On Mon, Nov 16, 2026 at 03:46:49PM -0800, Bobby Eshleman wrote:
>> vsock_deliver_tap() clones every packet to every vsockmon device on the
>> system. Creating one needs only CAP_NET_ADMIN in the owning user
>> namespace, so an unprivileged user can capture the traffic of local mode
>> namespaces.
>>
>> Pass the packet's netns to vsock_deliver_tap() and only deliver to
>> devices that pass vsock_net_check_mode(), the same rule socket lookups
>> use. vhost passes the vhost_vsock netns, loopback the sending socket's
>> netns, and virtio-vsock NULL (global mode).
> 
> For local namespaces I think we are fine, but what about global?
> 
> Is it okay that a namespace with global can capture all the packets of other global namespaces?
> 
> Asking because at this point the CAP_NET_ADMIN is useless, since an user on a global namespace, without CAP_NET_ADMIN, can just create a namespace to have CAP_NET_ADMIN and access all the traffic. Should we fix also that?
My take is that the above question is quite orthogonal to the current patch
and may impact old applications relying on the legacy behavior.

/P

