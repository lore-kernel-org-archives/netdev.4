Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795531164;
	b=QwwmEcEG5JUjxf0lCBoAIiCcfjhvYCwm+KepnXokFHuNv0xN01PcUfE8zqt4p1Rn3V1y
	 ZzADFZ838vW09tjFids88UF0U9n46Op0foo+bjGgwEZEc+itbx90GJzs0vV8XBCi6e/E1
	 M/mXi0TzlAzVq1KqgONiauyWgPu3GneR9piKnuyGJYmvkTmJHHuVOw44Yudy85jyN0tf7
	 IkoY6vt1nNbxbShYqIKPmygYdE0fxRCiaYyi59uy12/KjZLExIzbnhl+mWfOqNEXPHydp
	 RaS2sa/qtl8w1TpIShNq75kqXbZKL5w40bpU9Qn0u7Z6Dm/YqryvrK4mFHUJEUBnpBA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795531164;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=2stGQ4/HiGTctVyhMRCTqhZkagSo1oOLNXehp2IlUCY=;
	b=u1H/pwgI9RgW86XmCE80I7+/X5W75MnEt2TOMQy7TfrNpavofBCDXkpct/KXKbPwc1Z+
	 C7VfzsVDkqNIxWYHK+j77rTrsYXsyPAuo9BH5hwJ4b3Ez7XbK0e/cdvex+2m7l/9hp/5p
	 wNmBMnV0umt/t6z+OcvDDirZQJUNSDGZWFS1oOAnxiFxki+ivaiZZhLLLVss5IsKIOESO
	 rSDG8TQeufmv/dE7rvz6vd8Fs/md8/+DXb6cDlc7OwoeKw+owqL7RdkvQ/dODuyFZ6bm6
	 1poTUm8kxkpZMJCHSSa3sTJT7LrtGfeaVxLs7JycqCpgeN1aLVmn9Lo7ULWixM9SpEQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T8UuG8ZY;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iDfPyZMA;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0EF5D606A327
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 14:39:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0EF5D606A327
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=T8UuG8ZY;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=iDfPyZMA
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795531162;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=2stGQ4/HiGTctVyhMRCTqhZkagSo1oOLNXehp2IlUCY=;
	b=T8UuG8ZYCnnEw/hILltYbvL+Ws/MrVmKMp8C9lrgcXLNVCcyBvt7SNpl2rDqZHyyY7UO1z
	CL3rthACmy2uwv9jhY5JaEezqCeZOFf/sesVGDYVfuTzKhXEbYBIEVqQ0xbOZgSiv0EM4s
	mGn3RCvcZDPgrRzLvrI0Xn914/OOVw0=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-86-Noxaw3nAOE2UCjsUjNw9ag-1; Tue, 24 Nov 2026 14:39:20 +0000
X-MC-Unique: Noxaw3nAOE2UCjsUjNw9ag-1
X-Mimecast-MFC-AGG-ID: Noxaw3nAOE2UCjsUjNw9ag_1795531159
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48fbcf023dcso2093222f8f.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 06:39:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795531159; x=1796135959; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=2stGQ4/HiGTctVyhMRCTqhZkagSo1oOLNXehp2IlUCY=;
        b=iDfPyZMAsOOf4GlAWF1w+Rvk09wYkTPmhUVxp+sx1qDuGhGyYHwa2dBhrcGQANOfQ9
         BEoN5/mSiHMh+r42ep+klS0kwN8CEsQS/8W5JrStS4jzqbfzDtIw6j4mTkHbM7IW7LrD
         5ZrS/9jIratGGiMTyu1NwBYjRZZQaOMOLudhzQ1TJAF0vwHLc7CraA5AzL4kz6GU7Xtj
         SdEOp3GcAqnnbOdiB4EZTMqL2/UWru291myeyEGPJ6GFbkd291b6yv+Ax44OxH5DDkIA
         fo8xhwh/vP1zdL7+D9iyaS15NnVHuDp2y7+fcfbgTHKV6nOeL//GRauqcBJC599aPnhl
         xE9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795531159; x=1796135959;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2stGQ4/HiGTctVyhMRCTqhZkagSo1oOLNXehp2IlUCY=;
        b=zKey7FyD4jC73C5gaIGWUrBit0pBoFO29diLiV4mFaJwLxUXB8Ez35YcyVQIA6B1mY
         1lszdwqQ4RLCHFdHq2YbR834Tb5IaM+0RKF++1WstF3FZPwpVTAooYiioqUdXiGhXAmv
         yy22th1VEPWzt/4a/rib3Wcl2FdoG7460tkqgC7YXI52TSQzBJmQxrsgG5aIyQgrARsO
         WU2aLXkg46ZL71FL0o4mejJ5O9D9z+0U3rZd4h6FBt87ocNyDr0RorKQu25Z6eyb+txd
         wLSjAqKMj4HYYLXwqMqWyAWJ8TzZCRfJj81SBmOLyjO4SqgHITBfSxwBiZ09np2TYSAs
         /vyQ==
X-Forwarded-Encrypted: i=1; AL+hErHfspKYYDL7oZtRkQNDSgaSQLn23GobroMAc69mL5gXLnpJaAo2I77nhrSOF+z0qJX/h+USr4c=@vger.kernel.org
X-Gm-Message-State: APuU4Z+FWOBrXzIFh1m/fLkZa0lfhYO0FkLTQCY7J3fWGJ7TtmnIFQly
	ZNaTIqL6RHr44auMIJ/e9nVSAUOE1wfNQDLEUggIfQDu0xqzjDxBUfkhqdG4aZGxhV41HnN1k8k
	VGvOno3B26i/Iewd4LmLht6khF6jF5zYCD9UY9lmTqOuFLXLwdsaWPIs0bw==
X-Gm-Gg: AZFdTZdnYlwvTBIuUDQa2Ob+haHlJeg//f3QxSez4qZihSu3F8P6u/Q8mzs6WxUxpkv
	6mxNhQ5dicvSuN2t8NHz7nGd/Zs+0FKGjTO03m/faykwqqHSKd5ct8hY4ljdc9wb66qEXaUThlx
	Sq/ZeRS2yK9+mp2SuVQYXrYKeabgsdQ6dpFMgZw6M95o+bBrFFgLnmNbLHqvvSWg32nNsL9u4ue
	duwpwpnwIy/VtkvgzPAh/JGT0RHWSl3rYr5SaP16v4MUPZ13+QxKCuld78X+tj2Ei19uloRuPkF
	GR1XpwRwHWKr8TBzIlmuWGHU2aVnSLYjQqcVIDtGpCCTXDA3z4ooSNU2CXLgntRfeTB3eiykbPd
	LMNTzfPWQEp68V/2+M6OizpaxWVTQnsI4nNptsj7n8OeAL5NEvuGJUliLRRwojs1aNBKMpND3wo
	3BVYvTeEzjvk1ml2mQOhUxQGJS7LbtOzlJbItYb9Vdbzk9
X-Received: by 2002:a05:6000:4705:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-4abb225e5f9mr30398852f8f.24.1795531159352;
        Tue, 24 Nov 2026 06:39:19 -0800 (PST)
X-Received: by 2002:a05:6000:4705:b0:48d:f851:ee5f with SMTP id ffacd0b85a97d-4abb225e5f9mr30398797f8f.24.1795531158872;
        Tue, 24 Nov 2026 06:39:18 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab6c340df4sm32920486f8f.55.2026.11.24.06.39.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2026 06:39:18 -0800 (PST)
Message-ID: <ebb9c249-85bf-4737-841f-ab6ddcaab5a9@redhat.com>
Date: Tue, 24 Nov 2026 15:39:17 +0100
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
To: Bobby Eshleman <bobbyeshleman@meta.com>, Michal Luczaj <mhal@rbox.co>
Cc: Stefano Garzarella <sgarzare@redhat.com>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 George Zhang <georgezhang@vmware.com>, Andy King <acking@vmware.com>,
 Dmitry Torokhov <dtor@vmware.com>, virtualization@lists.linux.dev,
 netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 Kyle Zeng <kylebot@openai.com>
References: <20261117-vsock-connect-close-v2-1-db5388323770@meta.com>
 <ed28d36a-682e-4db5-abf4-1339734e7c57@rbox.co>
 <awTJ8EOl52W0ph1K@devvm29614.prn0.facebook.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <awTJ8EOl52W0ph1K@devvm29614.prn0.facebook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/24/26 00:19, Bobby Eshleman wrote:
> On Sat, Nov 21, 2026 at 07:32:15PM +0100, Michal Luczaj wrote:
>> On 11/18/26 02:34, Bobby Eshleman wrote:
>>> vsock_connect() sleeps with the socket unlocked. Meanwhile the transport
>>> can complete the handshake, setting sock->state to SS_CONNECTED, and then
>>> reset the connection, e.g. in vhost_vsock_reset_orphans(),
>>> virtio_vsock_reset_sock() or vmci_transport_handle_detach(). When
>>> connect() gets the lock back, it finds sk_err set and moves the socket
>>> back to SS_UNCONNECTED. Userspace can then connect() the socket again,
>>> and a connect() to a CID on another transport makes
>>> vsock_assign_transport() release the transport the socket was connected
>>> on.
>>>
>>> Only move the socket back to SS_UNCONNECTED if it is still
>>> SS_CONNECTING. A socket that got connected stays SS_CONNECTED, and
>>> another connect() fails with -EISCONN.
>>>
>>> Likewise, only move sk_state to TCP_CLOSE if it is still TCP_SYN_SENT.
>>> Otherwise a second thread blocked in connect() on the same socket can
>>> time out after the first one failed and called listen(), and overwrite
>>> TCP_LISTEN.
>>
>> Ohh, this took me a while.
>>
>>> +/* Avoid breaking the socket when another thread has changed its state while
>>> + * we were asleep.
>>> + */
>>> +static void vsock_connect_close(struct socket *sock)
>>> +{
>>> +	struct sock *sk = sock->sk;
>>> +
>>> +	if (sk->sk_state == TCP_SYN_SENT)
>>> +		sk->sk_state = TCP_CLOSE;
>>> +	if (sock->state == SS_CONNECTING)
>>> +		sock->state = SS_UNCONNECTED;
>>> +}
>>
>> I was wondering why not
>>
>> 	if (sk->sk_state == TCP_SYN_SENT) {
>> 		sk->sk_state = TCP_CLOSE;
>> 		sock->state = SS_UNCONNECTED;
>> 	}
>>
>> and I think the only reasons we can't say "SYN_SENT iff CONNECTING" is
>> because shutdown() can flip SYN_SENT/CONNECTING to SYN_SENT/DISCONNECTING.
>> On connect's failure, the blocking path kinda-ignores such shutdown() and
>> resets the socket to UNCONNECTED anyway, while the non-blocking (i.e.
>> vsock_connect_timeout()) also consults sk_shutdown != SHUTDOWN_MASK.
>>
>> So how about being consistent:
>>
>> static void vsock_connect_close(struct socket *sock)
>> {
>> 	struct sock *sk = sock->sk;
>>
>> 	// we follow vsock_connect_timeout():
>> 	// TCP_SYN_SENT implies SS_{DIS,}CONNECTING;
>> 	// and we do check sk_shutdown
>> 	//
>> 	// or am I missing something?
>>
>> 	if (sk->sk_state == TCP_SYN_SENT &&
>> 	    sk->sk_shutdown != SHUTDOWN_MASK) {
>> 		sk->sk_state = TCP_CLOSE;
>> 		sock->state = SS_UNCONNECTED;
>> 	}
>> }
>>
>> What do you think?
> 
> I think we could say TCP_SYN_SENT implies SS_{DIS,}CONNECTING, but
> probably not the reverse... without a peer on the other end our connect
> request gets an RST reply, switching to TCP_CLOSE but leaving untouched
> SS_CONNECTING. Using only TCP_SYN_SENT then skips resetting
> SS_CONNECTING to SS_UNCONNECTED, and future connect() retries hit
> -EALREADY forever.
> 
> It seems to work for vsock_connect_timeout() because that function only
> needs to test if the attempt to connect is still pending (if yes, then
> close everything up), but vsock_connect_close() needs to know more
> precisely if the socket still holds the state that this current connect
> attempt changed... so it separately checks "Did we set TCP_SYN_SENT? if
> so, set to TCP_CLOSE.  Did we set SS_CONNECTING?  If so, set to
> SS_UNCONNECTED."
> 
> I think it might even make more sense to consolidate in the other
> direction and make vsock_connect_timeout() a caller of the new
> vsock_connect_close(), since it appears there is a similar edge case
> there...
> 
> connect(), O_NONBLOCK
>    transport->connect()  /* OP_REQUEST */
>    mod_delayed_work(connect_work)
> 
> shutdown(SHUT_RDWR)
>    sock->state = SS_DISCONNECTING
>    sk_shutdown = SHUTDOWN_MASK
> 
> vsock_connect_timeout()
>    skips the socket because of SHUTDOWN_MASK
>    /* still TCP_SYN_SENT / SS_DISCONNECTING */
> 
> late OP_RESPONSE, virtio_transport_recv_connecting()
>    sk_state = TCP_ESTABLISHED
>    sock->state = SS_CONNECTED
>    vsock_insert_connected()
> 
> So the attempt never times out, and a late OP_RESPONSE connects a
> socket the user already shut down, overwriting SS_DISCONNECTING with
> SS_CONNECTED. I think that's a separate bug for a separate patch,
> though.
> 
> Or am I off track / missing something?
I have slightly different question: is the 'multiple threads
connecting/disconnecting the same socket concurrently' a
relevant scenario? Otherwise if final state is self-consistent
(i.e. _NOT_ TCP_SYN_SENT + SS_DISCONNECTING) I think there is
nothing to fix here.

/P


