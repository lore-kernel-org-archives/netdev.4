Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795456090;
	b=avDiSXOAwyv/LFE4xy5HS/CwxNXhAtGYwyDc1N1xliwC4azxwfM33lHsns43eLsUB09W
	 NH5bTgJwFgCfEt5Co14QCb7EedQII/8ClR56wRiHsrHWe/STg+7wkSgdPy+oSwRAQbmtC
	 QhaFA1bSVvYzARn+4qTvLFzGPvW35OOoYtgsVrFf0RRuzIanN90N5mcnzcEjdKn8ASveu
	 k245SpAubqLC+KN0U39CUxY/DuGuGoWaUmQ0I949khj/YY5ESIrv5bnThUpXV2R70XnJU
	 8JYmm7EL+T6WOZ0HygY+49edxATyNjEnQshusNGAtEIEzN+U1Rlj5Ay5Y4QD4j/7csw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795456090;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:Cc:Subject:Message-ID:References:
	 MIME-Version:Content-Type:Content-Disposition:In-Reply-To;
	bh=efi+X92Ps3JgkqQpyvgXaDyiPmGb9o+2rCD9ipnlxzQ=;
	b=a4wOkpjPTPYNF6vyuZOSJs04psiasH1LkP1cl5VYZX0YmIFIct38KfsWIN12UoYpladZ
	 D0ArjbmmoBHycumWI+8BKVnyW9zn2b8pGHAaxhz6Sj14LLKRJrdumWkx52lsi4mkWC7eJ
	 yOH7RFq7T7Wn+saRMh1euKfP7omR3mTizdMZzM/cOGdZjod5AkSKXydWhAb3qbq9WgP1e
	 r/p1qbTn1jEiz83vTTtIKTMDiOuHxJK+fqn6W7tXt5Ouc8mvSWf/5vrwlEOYUmDVCB8aI
	 1T+egZSTmY1LrUEaciEyEyPA2QohIC3BYig5+YaGENsPRn67eP+IeyEGVOyoqIWtHKA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b="f9lDTl/R";
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I7zYFimT;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FF4E606A332
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 17:48:09 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0FF4E606A332
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f9lDTl/R;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=I7zYFimT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795456088;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=efi+X92Ps3JgkqQpyvgXaDyiPmGb9o+2rCD9ipnlxzQ=;
	b=f9lDTl/RMpuLahiED5XMcBxslDzePhdgBuf+egDZvPGoqOEeZDfLxlB5iW9vneCQG1WOWy
	+3l4SwLGI/KYkTUhRsR2uBMMJHpzAsUHPfUkO//Yy9RAZVTKplDOvOb8jNIjTFbxRgi6m6
	iSyCFT40LyGpjejCI3u/qr8HN2bhsyk=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-377-_8xYElkYNIq8vrHkS65mww-1; Mon, 23 Nov 2026 17:48:05 +0000
X-MC-Unique: _8xYElkYNIq8vrHkS65mww-1
X-Mimecast-MFC-AGG-ID: _8xYElkYNIq8vrHkS65mww_1795456084
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-499ca65ae87so1528995f8f.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 09:48:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795456084; x=1796060884; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=efi+X92Ps3JgkqQpyvgXaDyiPmGb9o+2rCD9ipnlxzQ=;
        b=I7zYFimTiLk4Rzqu2GcOQhrgfJCXrZm/XNcZ2tfv+D2MLltzagr/s2AK5ziRgSrbFf
         521KK/PuYN5ONOC+Kvi5yJpoS84/Ex7dtnbWIV75OSFSAKDRQyHrzyo7ewFA5UieNJuB
         fHFMjJp0i7VnmC1G3+Up7P3E9bM+uJK/KX1TIP+qP+JxtbvI/io5V2ejRC9Zm+T4SZx+
         S/QJvDnxMFT7uFygTGaZc1/qf3kDhzukUzq9fWvJ9Q8C0PPhnRkFhRh51CDBBqwkCQkY
         4c/zJS5tFpDoIsQzUT7bzxnZ2eTamuJdMLjG1LJAIHYKvlUEUk3nt6AGUbi5QXBl0eBF
         u/yg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795456084; x=1796060884;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=efi+X92Ps3JgkqQpyvgXaDyiPmGb9o+2rCD9ipnlxzQ=;
        b=lJN5bRa6FxuoLV87WVvjByxTK1KHnSywuRXoriVQN46K8avd61scLfbYYyRvD5gHKS
         yfvDoZDKPVdrra359v0umR5dploIOq+a6VE/6jn6tWofHrGF98Vze2P8lqk8yotbsuHQ
         CNon2U4SFLHyWGTbYiR6VDVRpVnUuP+ElbhV1mafhHOwjiXsCAthxe2681lKyyTUBFiU
         RodNJH/Xi1lgBf5N9zJVYsuZOLH28130lw1pLtwV2xjG9pCzjG/7mJayEr9TWyDNFyEs
         mwCaf8bfELSN+1oLdWCi4zvZCFrgLeQaL6Xm7s+tcqet1AMMaQUUWefNEypiT+INb1n9
         eTHQ==
X-Forwarded-Encrypted: i=1; AL+hErH4Gs6bB2Xdgw3+p3pvmSmfbFOUlmGktmONC+YEkwP2n5YZfE4/TKXBaL/FfOJxVVAvf0QLM7k=@vger.kernel.org
X-Gm-Message-State: APuU4Z8Azbn0f+j4c2dZFhlQ6s7XO2Uw/P7RTS/HiKi7N5Vk5Dpke1m2
	goRcI25lzXmm2Gy7ota7Fxt3LHYZJ7wyBUUQV+Yq1p6FaVHTopCyIN+9Vs5CdvyU1LLv+gVszkM
	Q4nxlI7WBT2cikM+nJB4rAIXK9sx1zRKVlIJ+44ZLs7oJ0kbF3QgBqDTMRQ==
X-Gm-Gg: AZFdTZdrgiBHwxyi7Ezc3nQujaoRdo7unc/ek8dBeoK93s0nDUtFSrLKRx8/b8QyRWX
	PivSNcRzmTtoIHX1ukHBH/oI6VB8YG9vg8EoFDchvngG4El4YEFhYjtAOryDyQWzayCvOA4NbPL
	BvKkNFNS4vDGtN8pAhhvTrR1AlOcQAp0mgAV44Zwa8W86SFCXpLjRxSmEuCpDlh0jjtwR1N/KLK
	8bij9uNNoK4e5zCssyAp6PTDay/Pnkl/j48rjD54s144Dim0MQreyr33AeFZn3cexb/jY2OetLO
	94N9EFO3jJ4t7iwgFRvhhhWFvP2mfSgBpDqz+xn7MEyZlxgKvLr2HKIhIilO8zrTZmEZaX60C/v
	tnhXX5fymmJTfIz6Ppw5s2Jy56AKkR0vn/F7te6Lr
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr30453919f8f.11.1795456084331;
        Mon, 23 Nov 2026 09:48:04 -0800 (PST)
X-Received: by 2002:a05:6000:4012:b0:4a8:f1a5:efb3 with SMTP id ffacd0b85a97d-4aa550796b2mr30453857f8f.11.1795456083757;
        Mon, 23 Nov 2026 09:48:03 -0800 (PST)
Received: from redhat.com ([2a0d:6fc0:1524:9e00:c39b:a740:e7:3fcf])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6bb989eesm23541150f8f.50.2026.11.23.09.48.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 23 Nov 2026 09:48:03 -0800 (PST)
Date: Mon, 23 Nov 2026 12:47:59 -0500
From: "Michael S. Tsirkin" <mst@redhat.com>
To: Nguyen Dinh Phi <phind.uet@gmail.com>
Cc: Stefan Hajnoczi <stefanha@redhat.com>,
	Stefano Garzarella <sgarzare@redhat.com>,
	Bobby Eshleman <bobbyeshleman@meta.com>,
	Jason Wang <jasowangio@gmail.com>,
	Eugenio =?iso-8859-1?Q?P=E9rez?= <eperezma@redhat.com>,
	Asias He <asias@redhat.com>, kvm@vger.kernel.org,
	virtualization@lists.linux.dev, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH net] vhost/vsock: annotate lockless accesses to guest_cid
Message-ID: <20261123124426-mutt-send-email-mst@kernel.org>
References: <20261117164916.2332953-1-phind.uet@gmail.com>
 <20261118012321-mutt-send-email-mst@kernel.org>
 <a7752192-b417-4e70-8f39-a3cdc983f447@gmail.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a7752192-b417-4e70-8f39-a3cdc983f447@gmail.com>

On Tue, Nov 24, 2026 at 12:48:34AM +0800, Nguyen Dinh Phi wrote:
> On 11/18/2026 2:33 PM, Michael S. Tsirkin wrote:
> > On Wed, Nov 18, 2026 at 12:48:43AM +0800, Nguyen Dinh Phi wrote:
> >> vhost_vsock.guest_cid is written by vhost_vsock_set_cid() under
> >> vhost_vsock_mutex, but It is also read without that mutex in
> >> vhost_vsock_handle_tx_kick(), and vhost_vsock_get().
> >>
> >> KCSAN will report data-race if we issue VHOST_VSOCK_SET_GUEST_CID
> >> ioctl while the device has TX traffic. For example:
> >>
> >>  write to 0xffff88810f1596ac of 4 bytes by task 7914 on cpu 1:
> >>    vhost_vsock_dev_ioctl+0x25f/0x720
> >>    __x64_sys_ioctl+0xc2/0x110
> >>    x64_sys_call+0x299/0x20a0
> >>    do_syscall_64+0xc9/0x510
> >>    entry_SYSCALL_64_after_hwframe+0x76/0x7e
> >>
> >>   read to 0xffff88810f1596ac of 4 bytes by task 7910 on cpu 3:
> >>    vhost_vsock_handle_tx_kick+0x41b/0x740
> >>    vhost_run_work_list+0x97/0xc0
> >>    vhost_task_fn+0x98/0x1f0
> >>    ret_from_fork+0x2e2/0x3c0
> >>    ret_from_fork_asm+0x1a/0x30
> >>
> >>   value changed: 0x0000004d -> 0x00000032
> >>
> >> Both readers load the CID once and works correctly with either the
> >> old or the new value.
> >>
> >> Mark the store with WRITE_ONCE() and the two lockless loads with
> >> READ_ONCE(), so KCSAN knows the race is intentional.
> > 
> > You make it sounds like it is just KCSAN false positive.
> > Is it?
> > if yes, this should be data_race. If no, document why.
> >
> 
> This is an actual data race, not a false positive. The value of guest_cid
> can change while the TX worker or lookup path reads it with plain accesses.
> Because each check loads the CID once and either value is valid, the result
> is equivalent to the read running just before or just after the ioctl.

So, no bug. Pls clarify in commit log.

> Even so, plain concurrent accesses are a data race under the Linux kernel
> memory model, and using READ_ONCE()/WRITE_ONCE() also prevents
> compiler re-fetching or tearing rather than just silencing KCSAN.

It never happens of course, but avoiding this
in case code is refactored could be ok.
Pls document that as the reason to prefer READ_ONCE.


> >>
> >> Fixes: 433fc58e6bf2 ("VSOCK: Introduce vhost_vsock.ko")
> >> Signed-off-by: Nguyen Dinh Phi <phind.uet@gmail.com>
> >> ---
> >>  drivers/vhost/vsock.c | 6 +++---
> >>  1 file changed, 3 insertions(+), 3 deletions(-)
> >>
> >> diff --git a/drivers/vhost/vsock.c b/drivers/vhost/vsock.c
> >> index 88a310390eb0..f26c59013075 100644
> >> --- a/drivers/vhost/vsock.c
> >> +++ b/drivers/vhost/vsock.c
> >> @@ -78,7 +78,7 @@ static struct vhost_vsock *vhost_vsock_get(u32 guest_cid, struct net *net)
> >>  
> >>  	hash_for_each_possible_rcu(vhost_vsock_hash, vsock, hash, guest_cid,
> >>  				   lockdep_is_held(&vhost_vsock_mutex)) {
> >> -		u32 other_cid = vsock->guest_cid;
> >> +		u32 other_cid = READ_ONCE(vsock->guest_cid);
> >>  
> >>  		/* Skip instances that have no CID yet */
> >>  		if (other_cid == 0)
> >> @@ -572,7 +572,7 @@ static void vhost_vsock_handle_tx_kick(struct vhost_work *work)
> >>  		hdr = virtio_vsock_hdr(skb);
> >>  
> >>  		/* Only accept correctly addressed packets */
> >> -		if (le64_to_cpu(hdr->src_cid) == vsock->guest_cid &&
> >> +		if (le64_to_cpu(hdr->src_cid) == READ_ONCE(vsock->guest_cid) &&
> >>  		    le64_to_cpu(hdr->dst_cid) ==
> >>  		    vhost_transport_get_local_cid())
> >>  			virtio_transport_recv_pkt(&vhost_transport, skb,
> > 
> > Will prevent compiler from hoisting the reads out of the loops.
> > Does it matter?
> > 
> 
> Not much in practice: because the loop body calls non-inline functions, the
> field needs to be reloaded across calls anyway (and in `vhost_vsock_get()`,
> the `vsock` pointer changes on every iteration). I checked with gcc 16.2 and
> clang 21, and the compiler does not hoist the load out of the loop even
> without the patch.
> 

