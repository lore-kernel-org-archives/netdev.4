Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795685806;
	b=C8Sw86cfvhX24PBcB6OIt+4jRZMcwo9zZmbWedbP5JTAOL5W/ZJj4Rd6HkGB+thcam1W
	 /Sy7/CY+F/8M7QB4yzBXs2aGUb+JCJtC7bPCSF/w/w1yoVjBv8MilpwZX7jgJxKf989oJ
	 +BHo/oyOBAQcbdMkykPHaXgnwh2fHEzUlNWmmaQ/cFfiHgCEIkNgdzHrYvhNOkBx0soF5
	 3G0nIvegDdPfgd1wV2GdIWZBzmvLXiQndygs/UZiN2I+2a9Pm4t9c8OKqhUnH2VGlijHZ
	 byeOafylVNPfHwb58gi9qzgPmQK9CWzLqAPg/mdOzq9n8U2bMNW6oWdGbn5D1TG2I1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795685806;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=aVKf33iFmZ/FS8Jv8TuBDCNvO088rPcYaeSvAjoqfsU=;
	b=xiyv17rG7sgW7vmDQqRMD5A+cZ0jnPixSTOsSHGB5V6Gnz9FKY1JBNfS0MoDRgPBMNIU
	 hgupIbv0LRATLHyUnBVuJmJu3OAh8o/YMFusDMk6KDzsIfxgrI4VFdO+Z1qqWROD9uDf5
	 9noxTi4ET1rLTYY9QuQQ1+Obp20CyU6My/JHKlUQqTvjonAQB0CZFH8b0b1XLGuQgyXpU
	 efBVFjSoCm31O/T4OXiaG13TinW4vx3QmMp2pqitr8ZpSN4A0av6HvExaPQBca5VovoEw
	 eFVOWdYGcFUTzqxfRsddn7hlfS5IOr6KqFfPJs0jHdoSO+ij8JXEHvN43YFUxWGPYkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BksUYfQz;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JASe6Mem;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79D4960A260E
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 09:36:45 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 79D4960A260E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=BksUYfQz;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=JASe6Mem
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795685804;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=aVKf33iFmZ/FS8Jv8TuBDCNvO088rPcYaeSvAjoqfsU=;
	b=BksUYfQzb3SSd5l2dva+7IYr/bFE5tZM56nQTiQpFsskmcij6ZXoEdSm67EQuRS3/zyE8Y
	WamMHbYKL/Pv2jbjeDi8AWzJqLhDR+K3w+/foOV1KNXP0e/7qpbtma9Ard60KXwZCcD/+S
	C5m/UpsNtdNH2ndyvaAncmtxHEOJOxE=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-557-qI1SRXlsPRi7lLYBEhdb6g-1; Thu, 26 Nov 2026 09:36:42 +0000
X-MC-Unique: qI1SRXlsPRi7lLYBEhdb6g-1
X-Mimecast-MFC-AGG-ID: qI1SRXlsPRi7lLYBEhdb6g_1795685801
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-48e0ef019a4so4211206f8f.3
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 01:36:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795685801; x=1796290601; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aVKf33iFmZ/FS8Jv8TuBDCNvO088rPcYaeSvAjoqfsU=;
        b=JASe6Memg2Pq7yLT0+4lDupJlLsFq8AFRZE4uTXlE5jf60yp4WtJ/kP6wFZI/FsjZb
         swjvd4hEBh0JIr/+/Liy+d7f1De9bUX0dMeamj9oIhqE3XJx/54lhX++YjAMvw4aU5IX
         /BGcSgYqJmsHzBrbNruVXQK2r/DItnDb9L8WC5vnZyywPIEerfjHBpGlcbSAI+DyjUM+
         ZigRHIcSaWks9bxQ4F7uj94J6CCoNC5TAPA9nVRD4HuKyfMKuRu6NumwoCNC89yL3sV1
         /Zt5/H8RQWh6FS6ftfVY5TQ0Xxq+eeJxPhJhZiwwgv71hIy4yQx2JcGft/Xn+6coGwLb
         XTBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795685801; x=1796290601;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=aVKf33iFmZ/FS8Jv8TuBDCNvO088rPcYaeSvAjoqfsU=;
        b=rvS6ehSvLwUEQWKLzLwYbCICYUBlhW3ogu57XSrHjFVaFFNXsTB+9xvrazwb/w+rsl
         tBj4vG5mMtHzHZrN2VapRos+Ko8UlaXeKs+eMDYRD1Tw5vSCy22rc2/HMlVni/3Glbtu
         V2CsDT/amokE+KKTgNFu0Ch7+mj0nbX/xjCoMePr3+HpBMKmntMjEcgZgg7bzGE4t7bO
         aqVzUUzHL5imMYKDYzCimU/EUmce5zfDXIZu5acX+iZZYiQ5WD1zFIZoIXSeAU9djfL7
         SkOqCTPbHc2AmKAKU9gPq5t5DkxWcpwCKXP674UunPOAsIHShMDRy30ZC5myrb+/gJqH
         +Xgw==
X-Forwarded-Encrypted: i=1; AL+hErGM1yhTuO+RiQ+kCnESJRQlpcDahrpzHQ5AvmDYEoVyzI+7XD4Ys3QXsfQLI2Ei3EYTBuF9YKY=@vger.kernel.org
X-Gm-Message-State: APuU4Z8iLwxiMHXg2y2FBbvpdOzpULJTfhWj8ZY+4EdScAixAaS5P5Lf
	WzKBktEyX4xweGzkltG7kB7WWs1J72WHW03PXwHgqjaw41KPua8406Mi8ZSGRFFK9gRxHpkMHE1
	3+x8Rfw0AbuDFqohcDdJGbP1z33/eeoR65X4KZVpLYnt86cbgwzbYVcU2uQ==
X-Gm-Gg: AZFdTZcftNj5nv+QOy/KBHNmjwysrOAXeqjeOOQQ3lTooSBiZOSHS4b57yuqtmDXzPy
	at+2Sq+fKHc+oTGiDx8QS1yqHLDrEhRIP9gcaUoQcNOaN9kqAFRx3nic7J2ZDw/+RObiULysE/r
	k5VSbDJXB3gMP4sgNYn5/G+jTZ92Q8LZEQRr/lhG/S0Nx6wLR14YYciKfdBppN+h42cu64JIabU
	jseIFsSlY+7cJvRuI6XU5bWSvVqkxAvyHTvnZ6kLQRpbCPnVMAEGvsrrItagzz1/EAIIQmlXcbb
	BZBTe2caxH8ve7Y2jH97+npkxb4r4s5OJutX0jXa2EUzBitgu4blj4ZL/+66eEKgLU2yTmQWbpC
	6W6eJ5C6FQ/Bjf7EzNeKSLlSGSUlwa2WiTAxkNFe56Or9GJ6xP+D02EviAPylpCyNKulUI06VFn
	6gmpd01UCeRlad78Rt7doRswwgWbjN9ktNIGU1Z1PF1Pmi
X-Received: by 2002:a05:6000:26ca:b0:4aa:8fc3:2909 with SMTP id ffacd0b85a97d-4abad5ac730mr36429084f8f.2.1795685801031;
        Thu, 26 Nov 2026 01:36:41 -0800 (PST)
X-Received: by 2002:a05:6000:26ca:b0:4aa:8fc3:2909 with SMTP id ffacd0b85a97d-4abad5ac730mr36429042f8f.2.1795685800577;
        Thu, 26 Nov 2026 01:36:40 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf685asm39753707f8f.20.2026.11.26.01.36.39
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 Nov 2026 01:36:39 -0800 (PST)
Message-ID: <bd19a37a-0e5b-4c88-a4f0-1fd5378c746b@redhat.com>
Date: Thu, 26 Nov 2026 10:36:38 +0100
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
Subject: Re: [PATCH net] ipv6: anycast: delete the anycast route under
 idev->lock
To: Ido Schimmel <idosch@nvidia.com>, Kyuwon Cho <kyuwoncho18@gmail.com>
Cc: "David S. Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 David Ahern <dsahern@kernel.org>, Kuniyuki Iwashima <kuniyu@google.com>,
 Jiayuan Chen <jiayuan.chen@linux.dev>, Willem de Bruijn
 <willemb@google.com>, Simon Horman <horms@kernel.org>, netdev@vger.kernel.org
References: <179552107133.1345245.9532670970901182620@gmail.com>
 <20261126092020.GA608373@shredder>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261126092020.GA608373@shredder>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/26/26 10:20, Ido Schimmel wrote:
> On Tue, Nov 24, 2026 at 10:32:26PM +0900, Kyuwon Cho wrote:
>> IPV6_LEAVE_ANYCAST no longer holds RTNL, so a join of the same address
>> can run between the two halves of its last leave. __ipv6_dev_ac_dec()
>> unlinks the aca from idev->ac_list under idev->lock but deletes its
>> anycast route only after dropping the lock. A join in that window finds
>> no aca and creates a new one, and its ip6_ins_rt() fails with -EEXIST
>> because the old route is still in the table. __ipv6_dev_ac_inc()
>> ignores that error, the leave then deletes the old route, and the
>> address stays joined without an anycast route in the local table.
>>
>> Delete the route before dropping idev->lock.
>>
>> Fixes: f7fdf13bf103 ("ipv6: anycast: Don't hold RTNL for IPV6_LEAVE_ANYCAST and IPV6_ADDRFORM.")
>> Signed-off-by: Kyuwon Cho <kyuwoncho18@gmail.com>
> 
> Reviewed-by: Ido Schimmel <idosch@nvidia.com>
> 
> Note that:
> 
> "Avoid having more than 15 patches, across all series, outstanding for
> review on the mailing list for a single tree. In other words, a maximum
> of 15 patches under review on net, and a maximum of 15 patches under
> review on net-next."
> 
> https://docs.kernel.org/next/process/maintainer-netdev.html#limit-patches-outstanding-on-mailing-list
> 
> And according to patchwork you already have 17 patches under review for
> net.

To augment such statement, the maximum limit is intended for established
contributors with a consistent record of reviewing effort spent on the ML.

@Kyuwon Cho: you should limit yourself to no more than an handful of
patches in flight.

Thanks,

Paolo

