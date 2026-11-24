Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795509840;
	b=efxticeo1EbRyz5c0xk4UIqDqIJ21QuaTkIaB3iuIAvqX9FbSTY3pzyAB+8Su782n+gp
	 wtpPxkugspYUfHBMlywVqEfUurYq42T4nNCyMdiwdQx81NtJhGjpiBotGKaeCApvgYVuw
	 l0UFEFUJdKvfoD1+pyty7iGY0elc/eRnTJmoRKejlmxFLGboYhZq+wvB7xWckMcRPs8xt
	 2AO433Ck2drFNNHkGuH9aDH+uA06w7OkFbf6HtPA4ksBQBpatVPpGY4ydtKJyEXEJ28Px
	 09M3QX/v9N5zVl9rpGDqvmD9a/lXnlO6a/4OuYdQmSkAPhRXn+NBxcQg2BLuvWRvN4Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795509840;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=80CiTGjH5Hdr3PjM7hQctIDbA2YeYVq6CaZ6FaFB58Q=;
	b=yCH3BgO8/SeOyQmMmxKwpbWRpwl4fvMgtax6pAQ5S5tjiPeYpA8/LPAZuClex+m0P/xg
	 Ci24tPw1SaYsHZYUDbEhFH261mreHYZTobUODxxidW0P2u+6F8DOj0J6+xbuGFo1EFI5e
	 F5sWvkkwEU6sbtZBKW9Dd/yaG+lNg/m7PBvAU3GYLVUckz/W7xY6WZ3lhVA869y0QQGXy
	 fyOM9RP3bMLLe8DG73zeLR+KMJWg84iKsAaEtWzDcsMcHcpngdkjizL8KioH1M0/8dHOU
	 9Xraf22bxt6GUsusD/x0JQMkGaRDWjZ0ftgxoFhld9Zk+jfUUzaHYY6cBEAfT3X4eDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IZCN50Qf;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Bmf5Fpj8;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36543606A339
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 08:44:00 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 36543606A339
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=IZCN50Qf;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=Bmf5Fpj8
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795509839;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=80CiTGjH5Hdr3PjM7hQctIDbA2YeYVq6CaZ6FaFB58Q=;
	b=IZCN50QfMogHZG/XZbc4ZCTzzbeIvaGz2M3vHcsNtlPkftvGnadsB45j2aX1IXrsbMBXEY
	8/sYpnvCBzQvOXsReDkTDMXu0Ogywk+uDIz2OTKX/aiILWrV+oyiJftCg+Xs/cnzyFuYUD
	uO7cvNF+YLummMZ+TEfG3Oi2yb809bA=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-78-htcXV38YPjyJaBGk8QbJFA-1; Tue, 24 Nov 2026 08:43:55 +0000
X-MC-Unique: htcXV38YPjyJaBGk8QbJFA-1
X-Mimecast-MFC-AGG-ID: htcXV38YPjyJaBGk8QbJFA_1795509834
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e0fc747a7so2876361f8f.1
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 00:43:55 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795509834; x=1796114634; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=80CiTGjH5Hdr3PjM7hQctIDbA2YeYVq6CaZ6FaFB58Q=;
        b=Bmf5Fpj8dfj9+YAzmmLs7zprxnhD6SqSw7cHcSsRhi3zs08vLSTERt6nt4VFpGF+xI
         KoxO5EfFihJmwOURYPuFSB9O+JlD7uaO+a0YalrQu+uG977ZkSP02FXU+hAmYXyKAqfD
         mlVrBXqV46SdsqcpXsQGiaPMoTTKEyLpYRgaivhxGsf21PvD7DyL5beRToY6e3rrPLAD
         X1RSVBzY5i2z5vmkcIiCT7ppgobuzIqjYfvKLdRcYGUMJKT7f4jtkS6Wg3jNTI977RGf
         Rv4ekNdCva491+zTMeUrOTY8gWTtDDffnC/0y0Qmkmp99TYluuZ82yaUGnprC1eQvwlw
         ZklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795509834; x=1796114634;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=80CiTGjH5Hdr3PjM7hQctIDbA2YeYVq6CaZ6FaFB58Q=;
        b=Fz6FWMhVQTiZlLrhZ75DnnwCr5hAM1/wDzAHzNNbKBbr56vPFc8VhKNNuNRZj9UNeM
         lI51JNU8vqls2D2XDJxeEEfR0WnCPgERZroTNAYMR8KAoat1ATt4fWu6pxhCuA7BI9wU
         5vX+Cuix3WWJOb8shlgKtKc4TRJJFeahraOJjS2JvYmnRQTctMc0bABUJ59cNxEBE+lZ
         bHknmoQHZdVuQx/IQqONdUJSU1dGJM2H8Wvs+QIY82E79RpA7yKwWlZrk90aUFBqT7UT
         qwPGZo5UNG1ocRyS4k/7hEAiUx2N2jCE3X3v6Kj97twOluW/JfJLI6qQmghVqIZWa5VT
         9Drg==
X-Forwarded-Encrypted: i=1; AL+hErGM5icoKcOHQI1ACFuShkOod654Kh3ZSnhDlswaHXO85PrGVMCO/0L6svZo8mK93h0Uj2U/O9Q=@vger.kernel.org
X-Gm-Message-State: APuU4Z/+r6C9BTokmlfkzkoaSCJmXcVnlQ2xzsFeyd98BaIYkufJQ5bx
	81Mf/LjlOv0c7cyItscJ9U6A0W34Mxsp/6kwzP0ITdUH2Y9PrdWwvmT+sKl2nwY4umz8/w3eJMx
	PZwbPymFogNCqEWU78ByIHHrLIXjAbp6mzefaoRKDFlFHHU8g9lTVhHt3+w==
X-Gm-Gg: AZFdTZdmGEJmNPvfUfKnf0Md4JwSrXKifBOIxK8aUfWs603PkGKficae23RpiRC2A+P
	vcoobH6wqnSOJRC/3AKEq5xbTf3/TPPoA6oi1wJrQv6NYHOoG5KPrjcmigae4GC0oimex0kRRCp
	NlvTD6biR3R4ecwN913L0ikMVFYmjJIrGmdOIlkCbFbslvK2IdO89jckWIXw2doDH4zL04HJC0Q
	5aAk1in4ITd5yPipwapUMmXcpyqnCtIpWdRd0gxbV1yCCX+p1ofxOvCjLLQlUEzeAJzJtKACc6D
	c5tDLBWBVOMi6ygFjY4pGuSxgWfyZim2zqHLgcitdIYn0dOPIceh8oBTthRA2/0nbEYpUOSWMM9
	DbXA0EKOkvOvdqKHoNRrb8rt5q+f0iyZJsjfm0AKw+sYffBv6wXGy0w==
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr314618275e9.10.1795509833925;
        Tue, 24 Nov 2026 00:43:53 -0800 (PST)
X-Received: by 2002:a05:600c:4f10:b0:4bb:60bd:5398 with SMTP id 5b1f17b1804b1-4bb88804d35mr314617705e9.10.1795509833526;
        Tue, 24 Nov 2026 00:43:53 -0800 (PST)
Received: from sgarzare-redhat ([80.116.143.202])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853b216esm472636285e9.12.2026.11.24.00.43.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 00:43:51 -0800 (PST)
Date: Tue, 24 Nov 2026 09:43:46 +0100
From: Stefano Garzarella <sgarzare@redhat.com>
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Paolo Abeni <pabeni@redhat.com>, Stefan Hajnoczi <stefanha@redhat.com>, 
	"Michael S. Tsirkin" <mst@redhat.com>, Jason Wang <jasowangio@gmail.com>, 
	Eugenio =?utf-8?B?UMOpcmV6?= <eperezma@redhat.com>, Xuan Zhuo <xuanzhuo@linux.alibaba.com>, 
	"David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>, kvm@vger.kernel.org, 
	virtualization@lists.linux.dev, netdev@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vsock: only deliver taps to namespaces that can
 reach the device
Message-ID: <awVNJ4gXA7ZxvZcb@sgarzare-redhat>
References: <20261116-vsock-tap-net-v1-1-7e24f45adad3@meta.com>
 <awQJo8WE5Gn4nYHp@sgarzare-redhat>
 <12a2b44d-3d24-4b77-9dd5-24361d5fe910@redhat.com>
 <awQ5xzF8P0NJiCsv@sgarzare-redhat>
 <awRnZ9S+3B996VqJ@devvm29614.prn0.facebook.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <awRnZ9S+3B996VqJ@devvm29614.prn0.facebook.com>

On Mon, Nov 23, 2026 at 08:18:47AM -0800, Bobby Eshleman wrote:
>On Mon, Nov 23, 2026 at 02:17:54PM +0100, Stefano Garzarella wrote:
>> On Mon, Nov 23, 2026 at 12:58:38PM +0100, Paolo Abeni wrote:
>> > On 11/23/26 10:43, Stefano Garzarella wrote:
>> > > On Mon, Nov 16, 2026 at 03:46:49PM -0800, Bobby Eshleman wrote:
>> > > > vsock_deliver_tap() clones every packet to every vsockmon device on the
>> > > > system. Creating one needs only CAP_NET_ADMIN in the owning user
>> > > > namespace, so an unprivileged user can capture the traffic of local mode
>> > > > namespaces.
>> > > >
>> > > > Pass the packet's netns to vsock_deliver_tap() and only deliver to
>> > > > devices that pass vsock_net_check_mode(), the same rule socket lookups
>> > > > use. vhost passes the vhost_vsock netns, loopback the sending socket's
>> > > > netns, and virtio-vsock NULL (global mode).
>> > >
>> > > For local namespaces I think we are fine, but what about global?
>> > >
>> > > Is it okay that a namespace with global can capture all the packets of other global namespaces?
>> > >
>> > > Asking because at this point the CAP_NET_ADMIN is useless, since an user on a global namespace, without CAP_NET_ADMIN, can just create a namespace to have CAP_NET_ADMIN and access all the traffic. Should we fix also that?
>> > My take is that the above question is quite orthogonal to the current patch
>> > and may impact old applications relying on the legacy behavior.
>>
>> True, but I'm not sure that behavior was correct since the beginning.
>> E.g., what is the point of having CAP_NET_ADMIN requirement if an
>> unprivileged user can just crate a new namespace and get it?
>>
>> Anyway, it's eventually pre-existing netns support in vsock, so it should be
>> fixed with a followup.
>>
>>
>> Reviewed-by: Stefano Garzarella <sgarzare@redhat.com>
>>
>> Thanks,
>> Stefano
>>
>
>Its a fair point and I agree we should take it up in a follow up. My
>current instinct is that CAP_NET_ADMIN probably shouldn't be enforced
>for some (all?) of these global-mode paths.

Why not?

I should take a closer look at what’s going on with the NICs, what 
permissions does someone intercepting traffic need to have?

Ideally, even though the addressing is global, maybe we should set it up 
so that within a namespace, you can only observe traffic generated by 
that namespace or its children.

But honestly, I don’t know how complicated that is. In fact, if you want 
isolation, you have to enable “local,” and at that point, with this 
patch, we’re all set.

Thanks,
Stefano

