Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795439887;
	b=z84Oj9ViicFCTHGqA/rsVE9vOIGgQlTnIjrq7xu14nK6zSBD2knF4cMkujMydA5UoaEj
	 AWE9+52h6yb0W4zRLpte34Z/JsiXNPluWTPAG0GPdD7c/q0fGcNLFdnaOJnok8qdk78th
	 H6ghPkiGpV55fAtg7da5j8xulmWM5AtQP7pS3XEv9+MPP1CaVyIgVU8pZWkfXHp7fb2+z
	 rBN2ycjrUaB14sV0zpq3UdMY10/q2CwD/2hA+4UIERR84WBk3yjp8VZngazIJuxBOr2g5
	 TQYUUWQLxw+QiMpjnWH226j7ddc+z6W3GgvX4oRrp2xY/0ZI3zjwv4/R/C2GQ7PktMA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795439887;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=G8b0M55Qsr5j/jjPgd1PFdARJOj0KhBIrnCc7fyRQ00=;
	b=QUadERBs9CDZ4zHIUdHnIWk7lg3tNU891a8OAaiDA8KMzl1MSpmrNewO96IVCk9ex1cW
	 /lEYGp7RZCPBoMnvBPG+Y6AtymZECcDtao1BMD5XcqEWVvo799cmMSTyA1oGP5Rh7g36J
	 d5IxwWVlqeO1+psIc4axh7a14eDBz7890WC1qOFjSr9ava0v4nYvkfpX7FfypzwNSQLsY
	 LhV9N0VESqKPw70svDmXai9JX/LqnXJWH2U5AwnKMS9Fbbb7818qI4iaIUEcq5e5gzZh9
	 9O3wFc2ZuxEhzy5kLRdVQlWfW0VECSYY0KqK8HY2+xwATi7IGAmhLdM1dOFtsH1qu0w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CDvdGV1y;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m4CuOqD1;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 28CA7606A332
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 13:18:06 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 28CA7606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=CDvdGV1y;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=m4CuOqD1
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795439886;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=G8b0M55Qsr5j/jjPgd1PFdARJOj0KhBIrnCc7fyRQ00=;
	b=CDvdGV1yp88c7Y6e6SSS7bP21i3fiBH9iSr7kWHoHP+7TbMjpitKhEoAqGaSgNsO468WuY
	thzIP4vos6QpjcsW7tr9mppIszQ+mQ5jWVzXGd1Szb+le9AagXi6AKSgSXL4QTEIn/GBH/
	VWu6x+hVy8ncmKNyJ2U8nufqYtlPdbc=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-59-mAPlmpjUMXyrwtWmivXGVw-1; Mon, 23 Nov 2026 13:18:03 +0000
X-MC-Unique: mAPlmpjUMXyrwtWmivXGVw-1
X-Mimecast-MFC-AGG-ID: mAPlmpjUMXyrwtWmivXGVw_1795439882
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-4ab341c0696so921929f8f.0
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 05:18:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795439882; x=1796044682; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=G8b0M55Qsr5j/jjPgd1PFdARJOj0KhBIrnCc7fyRQ00=;
        b=m4CuOqD1CUmhFdN52EyYvTwbgcrXJHJuGricGbFZdL59CJbLFuFONQ6tex8gGVNcKY
         kLBNBqw0jskC9GgJctOqg4E9bK6D2z7cL15tZUqsug03E/Joid/lQpleDcFPmQwjhJdK
         4C0fWhlKKomMCF/ozv/NitIvG0EN62q40txRSq25zJKWBLKy9Jus1h2jCwKNdJajdO+b
         lIuLRl2wC/giU/5KKFt1nwjxFr7gvtyhq7URrUcA/Rg/W+aSfXNGOILExUtiYDD30fKi
         wLdfriIXuNok0QGLXKOY5gnA02TRIEkM5G15JoGTTw5caOLhwkex/iupB2ekfIWrSRJV
         /RPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795439882; x=1796044682;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=G8b0M55Qsr5j/jjPgd1PFdARJOj0KhBIrnCc7fyRQ00=;
        b=OrktDi4WkMGrr7kM4MQ9utIS25O27yCU+fXrRCwcuy/w9qNv95Lr1IEjsXBI2P2w9c
         7Vlk5ErlSnLLvGR5YmRMiEQWRqTYxLqdz3LSgtXCBFOfC8vMaNBuW61gZupqnRTqNfxv
         +zl15+2la6lHTZwhRQUtdEAJNXwsYX5y4ahPcRJFl72RVHM9Pmwhcmk4sZ7uIlthkUKI
         640flf5ia7mK+zsR9kvromaXxbqVm7EBb6fnjnD0LsJ9VpYclR5ERZ87B4JFesevbowf
         qdCDuF87qUv32SV6cScVjVGxmWgBwHrodcKs2xeCGno+SsC71bHGPGM3PAhcjaY1bRZH
         5fsg==
X-Forwarded-Encrypted: i=1; AL+hErGhZHJHWqM80nYPdQFmDuGqCwuzlRCZViFQ5BfXkAFbGkNlWPyvVIqfBVOFS9p9yjAsL95Dkoo=@vger.kernel.org
X-Gm-Message-State: APuU4Z8vq/UuJHXChXPj3vGE1Jbhap7LCCWyOlAOVxAPB8WlEU+K6IR7
	ZbaWEVTkzdIkqPZWkT1jS8aMffPSKX0i/AllyRdWwXyZzy+gCX8ny4ry8u7/LYxrLhO4PBYe+hL
	xJHqW3xQdD7e5+s9IRgmjNWntWjm8sQloLG0uzwy3y1//qb6REsZHNzYzPA==
X-Gm-Gg: AZFdTZf7TGk6cWVqg6lCHrxqKMcX+rRhlfSBh8u+5e5lRwliqnk7FxanTtm2CYzq4pU
	OxJ/IBzqhqiPJHUNSpddWNypiwgLdPKyzZPl0F9z+qGCDaXfaJx4iX41cOzVCYZQAgp9AgAqnDv
	U8LO/c/ASuvitzbYjnfpXTxE0ccgxkhIeUgMzr1OhW+ZG7nrpCb72zCO91nb2+NkPYAoT45RhMk
	ySYj92gf6EpDbFvjQS1zLtFRH/0B34bNeDqtOO0hEPELna51Be24C+Lc/aixvLrqWNrwT0sn+Ba
	ULZ0MEsCQWlVmwgRIvfZcdIz5mZtZqfHdqPZjyeCX3kOZxD5ZoadaJCUd2BiWXTltEe9zPCLKzE
	aGZDkSBMYeClF5FLrFtAJXNKNqTqi4yMME0rHvCtXCgTGbKKjQ0KsjA==
X-Received: by 2002:a05:6000:491a:b0:4ac:37ff:140b with SMTP id ffacd0b85a97d-4ac37ff143amr20351762f8f.25.1795439881964;
        Mon, 23 Nov 2026 05:18:01 -0800 (PST)
X-Received: by 2002:a05:6000:491a:b0:4ac:37ff:140b with SMTP id ffacd0b85a97d-4ac37ff143amr20351692f8f.25.1795439881467;
        Mon, 23 Nov 2026 05:18:01 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c61f558sm22435688f8f.58.2026.11.23.05.17.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 05:17:59 -0800 (PST)
Date: Mon, 23 Nov 2026 14:17:54 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Paolo Abeni <pabeni@redhat.com>
Cc: Bobby Eshleman <bobbyeshleman@meta.com>, 
	Stefan Hajnoczi <stefanha@redhat.com>, "Michael S. Tsirkin" <mst@redhat.com>, 
	Jason Wang <jasowangio@gmail.com>, Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, 
	Xuan Zhuo <xuanzhuo@linux.alibaba.com>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, 
	Simon Horman <horms@kernel.org>, kvm@vger.kernel.org, virtualization@lists.linux.dev, 
	netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can
 reach the device
Message-ID: <awQ5xzF8P0NJiCsv@sgarzare-redhat>
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
 <awQJo8WE5Gn4nYHp@sgarzare-redhat>
 <12a2b44d-3d24-4b77-9dd5-24361d5fe910@redhat.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <12a2b44d-3d24-4b77-9dd5-24361d5fe910@redhat.com>

On Mon, Nov 23, 2026 at 12:58:38PM +0100, Paolo Abeni wrote:
>On 11/23/26 10:43, Stefano Garzarella wrote:
>>On Mon, Nov 16, 2026 at 03:46:49PM -0800, Bobby Eshleman wrote:
>>>vsock_deliver_tap() clones every packet to every vsockmon device on the
>>>system. Creating one needs only CAP_NET_ADMIN in the owning user
>>>namespace, so an unprivileged user can capture the traffic of local mode
>>>namespaces.
>>>
>>>Pass the packet's netns to vsock_deliver_tap() and only deliver to
>>>devices that pass vsock_net_check_mode(), the same rule socket lookups
>>>use. vhost passes the vhost_vsock netns, loopback the sending socket's
>>>netns, and virtio-vsock NULL (global mode).
>>
>>For local namespaces I think we are fine, but what about global?
>>
>>Is it okay that a namespace with global can capture all the packets of other global namespaces?
>>
>>Asking because at this point the CAP_NET_ADMIN is useless, since an user on a global namespace, without CAP_NET_ADMIN, can just create a namespace to have CAP_NET_ADMIN and access all the traffic. Should we fix also that?
>My take is that the above question is quite orthogonal to the current patch
>and may impact old applications relying on the legacy behavior.

True, but I'm not sure that behavior was correct since the beginning.
E.g., what is the point of having CAP_NET_ADMIN requirement if an 
unprivileged user can just crate a new namespace and get it?

Anyway, it's eventually pre-existing netns support in vsock, so it 
should be fixed with a followup.


Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>

Thanks,
Stefano

