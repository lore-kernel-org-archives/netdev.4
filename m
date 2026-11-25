Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795600457;
	b=ZuKsXLZZbvmrSLb4ZXzVh/aie/iS76EOjaXqXT1XGHd8HeN1k98TGl2pf11EOi32pWSr
	 CBlTJFCr43n7oDeb0oCF2hFpB3oShM1sIV+QpHVxG0NeonNMvqEEgZl82Z5UgtbFSwcCz
	 Ta2lth6lkdmL/XwH9xFQ3s6qe95pwvmrq9z37uqxuRJ8gnW/uqnOSYZBGJJQkdEXCCEJd
	 3icp7H58K2o9Tf5BVOwME0Lu5/a0EAsoBWzBQxZBP0+k8mWM4LCeBbyd/o96rMqzkhfAC
	 +8s4pOeg7a0DzWjneXfCWyOGESFxYjWySUVoCk+jWctnPCIvBHkNmm95zZI57fa6UuQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795600457;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=8j77gnC9f+YQDzQiii69TniEPAX1CGFfmc9mLCWwyuA=;
	b=wuwXDY8yxi4xbmY/NSLYVdYCLEJV4X+dgLRGxEEEPwyl3w8wBwjjKFII+z8iY2x9M38P
	 trxCz9Fcku1wQJEcIYbsomSs7h1Vor3KTDKUD05xnn9PuWdem5KEsGqHQtIQPPcyBJzGS
	 yy3gcHJlb62gervs2jsO1S3IZJOhh9I3E9Bx6Vmng+jRp8MJw3KSjg7p/ovpQ4cTlRNQh
	 0AGDj0ugQv5P23Hz+tT7vIczXUK5xxRumy5jArieXVj3KNWAvYYlSBuCSMO/x18bY46Q3
	 yTRE37mCm2ozwSrJmY4KgDg/uJdUZGa78jM/kz69fiZQjzdvgJgamV+T507KaURri4Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OVLK3Opq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lGPeFG0c;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D064606A32A
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 09:54:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 3D064606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=OVLK3Opq;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=lGPeFG0c
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795600456;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=8j77gnC9f+YQDzQiii69TniEPAX1CGFfmc9mLCWwyuA=;
	b=OVLK3OpqPZ1PbW4YzsjZL1srx4DJiiDmin7qScR8QJwA8Uu1Rs14f9qPohv7P2GHulfZA7
	u6KFHEEUWbJ62peWvhbSKqOORhB3SjqNIRKcKNZXL0GewMpRUelU2qsy/n4fM5vUB1CKpt
	DNLCDbXitLV6uDjr3kMj3vXeRpzx2D8=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-639-g0yMwMqrN3eUE9kh5_ZQ4w-1; Wed, 25 Nov 2026 09:54:14 +0000
X-MC-Unique: g0yMwMqrN3eUE9kh5_ZQ4w-1
X-Mimecast-MFC-AGG-ID: g0yMwMqrN3eUE9kh5_ZQ4w_1795600453
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-490c1867460so3248667f8f.2
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 01:54:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795600453; x=1796205253; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8j77gnC9f+YQDzQiii69TniEPAX1CGFfmc9mLCWwyuA=;
        b=lGPeFG0cRCQh9LMxzgDoeNiPhYWke8l4sBHYOldXpF7zOUVAYWWSA65C1zDnNKYOYr
         H3w/aMztZbScZcTP5vZxLG7FVj8rblV2nn01PmRZv7xAJiSX3RXhvNOlv72TDEljhDm/
         5ZFB85WG9CJ3jqv1thHn/gTp9yKXh8neTDZS3PCCK9TK/ofTMPrEEhMplRBBUEVw1ggL
         dBQmbNyZcLn988SGNRGHhSYjME2eb/aNZKHJj5CRzX0tOrsYBXBC3Mqtseg5d3vbWM9e
         dZFZI/UCV79kuc41GqE8wE54RDph9ScEf5CKrdOf1zbrsEIT1frw9++VdpDdgwCzC6LH
         Prqw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795600453; x=1796205253;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=8j77gnC9f+YQDzQiii69TniEPAX1CGFfmc9mLCWwyuA=;
        b=yI/pZNQkp1wfNJqc9PW0mh2/unrZKG89aPrI+QQgY0Gc4kX8L0slRS8lpmfI1O0htG
         5OGk/IS6JBXq0liGaAQaxAt5d65c9yjb5A4MVembK/53JBip5JERiC4hchIwYVimu6gQ
         +8YmW/4xnJqzN9DVaLXilw7ZoRacIf7nYGiGFfPtjMqyptomHX1TUfKQULWa62tUriGC
         1OrxarqCW9MmcRv2fpAwlAn3OkspjTTwmk8Z3FDTR804mmGb9u1awMq2VT7WquoNWjsC
         /P6wa4iKcoOVG22sLtmfQRQqrosgcMuKSmXcD9KL3GzChDZNHa1XxF/saWQzVJCNutK+
         aebg==
X-Forwarded-Encrypted: i=1; AL+hErGGtM66KPRdbxoclf6vm3I9xvHaRRk8XpSXl9aDhW46Uilsh57aoq0j8kClFJ/HQF4Y889r67M=@vger.kernel.org
X-Gm-Message-State: APuU4Z+IUshYOdMYCMm4W9FeKShq3uZm7+qOS9ioXo+THo0gHvjWWCGk
	gmTMsh5E6XzpbRDvw+S0CrKUF7ewDw+r17G00D34nZnHtAxH0Eo2UkJUSxfRshonbgSCQJbxTWQ
	qUNLVAP5JEYsC9T+ftws6NnnrKUrllCpI5zzAJXvXEQoWnTe5LX/IaIyS7A==
X-Gm-Gg: AZFdTZceRRNwv+D1wGUZxN986WqJkAJqfgFBkouBgAg22NhOhiOQwCL8k6rY16omwCK
	kLGWjLGAbO7Fh8hz2/Hy4Sxl3f0kzd4BMbB31XfcPfeCLZDhmJDZWRvIUZoS300xshMkTtit7q/
	cHa412heEIAWTpXF2V8uXKEVWTQ9UxTbVFwMemLKvNgP+22sxno8w+4t9zkx7yCo+YDAdOW0/Aa
	V44wxxG7Qs+a154DD0YomX4Wjfp2jAxNVAsBAOK53af2UOW41s/ZHak44zhBTt6HeM93RrBTF6T
	WDgg5Vi4jXl+3f3T49hHe631SL6aiGbjc5JyndI1GBlGzrOxm5pUjl56KzEXpE0sG5xzF6eZpEz
	eminG1XLQVebTJHME+LY89rZd4Cj8KISdlcOwVoHLg5mZH//z+WLxg4aYtnKTunoRj5JYOlgvTs
	70Cu8rnxsKuOt+tNkLdf8jfrwCZUtZtqPIYqnlA8TmJucm
X-Received: by 2002:a05:6000:490f:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4abb47b242fmr33264139f8f.22.1795600452938;
        Wed, 25 Nov 2026 01:54:12 -0800 (PST)
X-Received: by 2002:a05:6000:490f:b0:492:a72:9303 with SMTP id ffacd0b85a97d-4abb47b242fmr33264099f8f.22.1795600452493;
        Wed, 25 Nov 2026 01:54:12 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab9cf005f2sm27250433f8f.45.2026.11.25.01.54.11
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 01:54:11 -0800 (PST)
Message-ID: <05ca76ec-3a6d-4ab4-ad88-86f95a793369@redhat.com>
Date: Wed, 25 Nov 2026 10:54:10 +0100
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
Subject: Re: [PATCH net v2] vsock: only undo SS_CONNECTING when connect()
 fails
To: Bobby Eshleman <bobbyeshleman@meta.com>
Cc: Michal Luczaj <mhal@rbox.co>, Stefano Garzarella <sgarzare@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 George Zhang <georgezhang@vmware.com>, Andy King <acking@vmware.com>,
 Dmitry Torokhov <dtor@vmware.com>, virtualization@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kyle Zeng <kylebot@openai.com>
References: <20261117-vsock-connect-close-v2-1-db5388323770@meta.com>
 <ed28d36a-682e-4db5-abf4-1339734e7c57@rbox.co>
 <awTJ8EOl52W0ph1K@devvm29614.prn0.facebook.com>
 <ebb9c249-85bf-4737-841f-ab6ddcaab5a9@redhat.com>
 <awXz6yo12ZOQPE8E@devvm29614.prn0.facebook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <awXz6yo12ZOQPE8E@devvm29614.prn0.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 21:30, Bobby Eshleman wrote:
> On Tue, Nov 24, 2026 at 03:39:17PM +0100, Paolo Abeni wrote:
>> On 11/24/26 00:19, Bobby Eshleman wrote:
>>> On Sat, Nov 21, 2026 at 07:32:15PM +0100, Michal Luczaj wrote:
>>>> On 11/18/26 02:34, Bobby Eshleman wrote:
>>>>> vsock_connect() sleeps with the socket unlocked. Meanwhile the transport
>>>>> can complete the handshake, setting sock->state to SS_CONNECTED, and then
>>>>> reset the connection, e.g. in vhost_vsock_reset_orphans(),
>>>>> virtio_vsock_reset_sock() or vmci_transport_handle_detach(). When
>>>>> connect() gets the lock back, it finds sk_err set and moves the socket
>>>>> back to SS_UNCONNECTED. Userspace can then connect() the socket again,
>>>>> and a connect() to a CID on another transport makes
>>>>> vsock_assign_transport() release the transport the socket was connected
>>>>> on.
>>>>>
>>>>> Only move the socket back to SS_UNCONNECTED if it is still
>>>>> SS_CONNECTING. A socket that got connected stays SS_CONNECTED, and
>>>>> another connect() fails with -EISCONN.
>>>>>
>>>>> Likewise, only move sk_state to TCP_CLOSE if it is still TCP_SYN_SENT.
>>>>> Otherwise a second thread blocked in connect() on the same socket can
>>>>> time out after the first one failed and called listen(), and overwrite
>>>>> TCP_LISTEN.
>>>>
>>>> Ohh, this took me a while.
>>>>
>>>>> +/* Avoid breaking the socket when another thread has changed its state while
>>>>> + * we were asleep.
>>>>> + */
>>>>> +static void vsock_connect_close(struct socket *sock)
>>>>> +{
>>>>> +	struct sock *sk = sock->sk;
>>>>> +
>>>>> +	if (sk->sk_state == TCP_SYN_SENT)
>>>>> +		sk->sk_state = TCP_CLOSE;
>>>>> +	if (sock->state == SS_CONNECTING)
>>>>> +		sock->state = SS_UNCONNECTED;
>>>>> +}
>>>>
>>>> I was wondering why not
>>>>
>>>> 	if (sk->sk_state == TCP_SYN_SENT) {
>>>> 		sk->sk_state = TCP_CLOSE;
>>>> 		sock->state = SS_UNCONNECTED;
>>>> 	}
>>>>
>>>> and I think the only reasons we can't say "SYN_SENT iff CONNECTING" is
>>>> because shutdown() can flip SYN_SENT/CONNECTING to SYN_SENT/DISCONNECTING.
>>>> On connect's failure, the blocking path kinda-ignores such shutdown() and
>>>> resets the socket to UNCONNECTED anyway, while the non-blocking (i.e.
>>>> vsock_connect_timeout()) also consults sk_shutdown != SHUTDOWN_MASK.
>>>>
>>>> So how about being consistent:
>>>>
>>>> static void vsock_connect_close(struct socket *sock)
>>>> {
>>>> 	struct sock *sk = sock->sk;
>>>>
>>>> 	// we follow vsock_connect_timeout():
>>>> 	// TCP_SYN_SENT implies SS_{DIS,}CONNECTING;
>>>> 	// and we do check sk_shutdown
>>>> 	//
>>>> 	// or am I missing something?
>>>>
>>>> 	if (sk->sk_state == TCP_SYN_SENT &&
>>>> 	    sk->sk_shutdown != SHUTDOWN_MASK) {
>>>> 		sk->sk_state = TCP_CLOSE;
>>>> 		sock->state = SS_UNCONNECTED;
>>>> 	}
>>>> }
>>>>
>>>> What do you think?
>>>
>>> I think we could say TCP_SYN_SENT implies SS_{DIS,}CONNECTING, but
>>> probably not the reverse... without a peer on the other end our connect
>>> request gets an RST reply, switching to TCP_CLOSE but leaving untouched
>>> SS_CONNECTING. Using only TCP_SYN_SENT then skips resetting
>>> SS_CONNECTING to SS_UNCONNECTED, and future connect() retries hit
>>> -EALREADY forever.
>>>
>>> It seems to work for vsock_connect_timeout() because that function only
>>> needs to test if the attempt to connect is still pending (if yes, then
>>> close everything up), but vsock_connect_close() needs to know more
>>> precisely if the socket still holds the state that this current connect
>>> attempt changed... so it separately checks "Did we set TCP_SYN_SENT? if
>>> so, set to TCP_CLOSE.  Did we set SS_CONNECTING?  If so, set to
>>> SS_UNCONNECTED."
>>>
>>> I think it might even make more sense to consolidate in the other
>>> direction and make vsock_connect_timeout() a caller of the new
>>> vsock_connect_close(), since it appears there is a similar edge case
>>> there...
>>>
>>> connect(), O_NONBLOCK
>>>     transport->connect()  /* OP_REQUEST */
>>>     mod_delayed_work(connect_work)
>>>
>>> shutdown(SHUT_RDWR)
>>>     sock->state = SS_DISCONNECTING
>>>     sk_shutdown = SHUTDOWN_MASK
>>>
>>> vsock_connect_timeout()
>>>     skips the socket because of SHUTDOWN_MASK
>>>     /* still TCP_SYN_SENT / SS_DISCONNECTING */
>>>
>>> late OP_RESPONSE, virtio_transport_recv_connecting()
>>>     sk_state = TCP_ESTABLISHED
>>>     sock->state = SS_CONNECTED
>>>     vsock_insert_connected()
>>>
>>> So the attempt never times out, and a late OP_RESPONSE connects a
>>> socket the user already shut down, overwriting SS_DISCONNECTING with
>>> SS_CONNECTED. I think that's a separate bug for a separate patch,
>>> though.
>>>
>>> Or am I off track / missing something?
>> I have slightly different question: is the 'multiple threads
>> connecting/disconnecting the same socket concurrently' a
>> relevant scenario? Otherwise if final state is self-consistent
>> (i.e. _NOT_ TCP_SYN_SENT + SS_DISCONNECTING) I think there is
>> nothing to fix here.
>>
>> /P
> 
> To your point, the only user-facing issue I can see with
> vsock_connect_timeout() would be seen in pretty rare cases.... Since it
> skips the socket when sk_shutdown == SHUTDOWN_MASK, if the peer never
> responds with RST the connect attempt never times out, the socket sits
> in TCP_SYN_SENT + SS_DISCONNECTING (connect() returning -EINVAL) until
> close(). But I'm pretty sure this could only happen on the vhost side if
> the guest was unresponsive/crashed or on the virtio side if maybe
> vhost's RST dropped during VM migration when vhost's send queue is
> purged. IMHO this should probably be fixed, but I don't think its worth
> turning the code upside down for.
> 
> Looking at this connect()/shutdown() sequence again today... with
> O_NONBLOCK, there is some inconsistent behavior that although is not
> caused by vsock_connect_timeout(), I'd like to mention here since its
> come up. It exists even for a single thread making both calls. Playing
> w/ vsock_loopback and bpftrace, it does end up with SS_DISCONNECTING +
> TCP_SYN_SENT, but I think the most unexpected thing from the user's
> perspective is that it temporarily flips to SS_CONNECTED even after
> shutdown() and a number of syscalls present the socket as connected:
> 
>    repro    connect()     -> -EINPROGRESS  SS_CONNECTING     TCP_SYN_SENT
>    repro    shutdown()    -> 0             SS_DISCONNECTING  TCP_SYN_SENT
>    repro    getpeername() -> -ENOTCONN     SS_DISCONNECTING  TCP_SYN_SENT
>    repro    connect()     -> -EINVAL       SS_DISCONNECTING  TCP_SYN_SENT
>    repro    recv()        -> -ENOTCONN     SS_DISCONNECTING  TCP_SYN_SENT
>    repro    SO_ERROR      =  0
>    repro    poll()        -> IN|HUP|RDHUP  SS_DISCONNECTING  TCP_SYN_SENT
>    kworker  recv_pkt(OP_RESPONSE)          SS_CONNECTED      TCP_ESTABLISHED
>    ^ the switch to connected is here
> 
>    repro    getpeername() -> 0             SS_CONNECTED      TCP_ESTABLISHED
>    repro    connect()     -> -EISCONN      SS_CONNECTED      TCP_ESTABLISHED
>    repro    recv()        -> 0             SS_CONNECTED      TCP_ESTABLISHED
>    repro    SO_ERROR      =  0
>    ^ the socket starts partially acting like it's connected/established
> 
>    repro    poll()        -> IN|HUP|RDHUP  SS_CONNECTED      TCP_ESTABLISHED
>    kworker  recv_pkt(OP_RST)               SS_CONNECTED      TCP_CLOSING
>    ^ eventually RST shows up and shuts things down
> 
> TCP handles this better... shutdown() on SYN_SENT socket aborts the
> connect attempt w/ tcp_disconnect() resulting in TCP_CLOSE,
> SS_UNCONNECTED, sk_err = ECONNRESET, and the late SYN-ACK doesn't push
> it into established, and users see POLLERR/SO_ERROR.
> 
> I think the TCP approach also fixes that edge case with
> vsock_connect_timeout(), since the user would at least see the errors.
Ok, it looks worth addressing. But possibly for net-next? since 'broken from
the beginning', not critical and possibly some functional change implied.

/P

