Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795769177;
	b=q9CEXfyJlkVo7I63pFetcz6IStFWiV/ApWNwipqeIH4r9aPiMt9b6JbtQEUxvzXTaLEE
	 InaBaRO2G9BULFsqia9KX/hYUADOdn5yrwTvcqMk4kPJmBzTPIQz+/1aD/g2hLhzaC7Bd
	 2zi4x9oXwidAN8IooZE6ZGAUQ5HBtO2C2CJNcsIjrGeRqyJkHIqz0CGXhTdk+WNSWiOBP
	 0CVicUn3TNjbQgPxydF/EUaa4eXDUyLNNJz/OtbcyiUKr3ohzTKiGALhcTp0qj79OoTQX
	 rGRNT5ZC7qm42Pxjw/h43NInPfsWRLolQjXVaqtpD2CkVmB+3479AH2JILp1cVzkyyQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795769177;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=igwRrFBoK1h9s1KUBKxODRaHXAteHTxYtqlng0AOnlc=;
	b=0iR+PE3+835NIHfwx3JRd7ZlzKJGbpdcgUxJApzi48tXv560NXqRemU+BcMlvLg6icl6
	 ByjQ1Sxtz+qmkQcvJDc+I8QMSFla5tUVxYwyPurya9e9J5f9x71EyKDPBLblpzfOyklbz
	 Og7XAHXecYu8/ct/DjDi4keWrNa1BkSF+oFclxvdSnH6+hGFiMMq+/kgCArNakf0YEEDV
	 Vk4l0VfLJPC6vRQsWVIVUl4HUXgvZrWIOynsCphD+fckUKOj9u3l5RuKmVh9y53K8ZMmr
	 XSG5oxZyXfarS2juCWPryZt0GkBiyfubIjjaseCpMCOva3zqYNTvjmcitiA1rFuFWyg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jzr2UxKq;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZMq3R919;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96380606A31E
	for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 08:46:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 96380606A31E
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=Jzr2UxKq;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=ZMq3R919
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795769175;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igwRrFBoK1h9s1KUBKxODRaHXAteHTxYtqlng0AOnlc=;
	b=Jzr2UxKqkRk0npxN+5YcAb30bjB7HhwLnFj1SR1ObprWsD58iLwthR3YnZz1BM7LpMbPYu
	aMbFppfDJOavT866BvuuG7ARixR9Em+k7pkDwNN42z+c8FCKNGBeTwYWIzwaBRgiD14131
	5DXGnHMAm/l20vsJ687hvjeuTzsTKwQ=
Received: from mail-wr1-f71.google.com (mail-wr1-f71.google.com
 [209.85.221.71]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-610-sZbNMxwMN62vDqfyDNOTDw-1; Fri, 27 Nov 2026 08:46:11 +0000
X-MC-Unique: sZbNMxwMN62vDqfyDNOTDw-1
X-Mimecast-MFC-AGG-ID: sZbNMxwMN62vDqfyDNOTDw_1795769170
Received: by mail-wr1-f71.google.com with SMTP id ffacd0b85a97d-48e29c25101so3460292f8f.3
        for <netdev@vger.kernel.org>; Fri, 27 Nov 2026 00:46:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795769170; x=1796373970; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=igwRrFBoK1h9s1KUBKxODRaHXAteHTxYtqlng0AOnlc=;
        b=ZMq3R9194W23mwAkAWcjjtGBbMeArTf6jMI94CZXEfnGJFUc3ErF5Fgj/nwC6xhEZa
         UC29qJoLrhF23XGryVLgyOkwFgQJwEisGEupJQXu3qy8rVM69Q/h757uneDC1S9HG0YQ
         H6onFF4gxOZOuPjGXOt6m/1uRETycZKR+X+whhlVY+d4kqc3Vk3GnCGmsv2Pv5U09GnS
         k1nlKrb1YZaEuMsLw+hiYyg5GnMmC2fjTexldHQmoUKnGIxw9aUsjkbURZRlEi6RI1qE
         TUQJmaX1dlAe+8kXkXHP4dvxZDBQToRptNkbxORnxho4qEBnHU8KduCKDUtNHJpQ43Xg
         xTUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795769170; x=1796373970;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=igwRrFBoK1h9s1KUBKxODRaHXAteHTxYtqlng0AOnlc=;
        b=kd1HDDAVOBwzRwj3ExwwC3VR/TBuAQ2Cz5V2RF9+JG6ZWJ+CdgKr+ZSYAeoRCwmaV0
         IfEU0bkrctKuHpdqasjhiof7K+mXCKRZj4zgqGSvNgaAmTms9A3ZxciivsrKgxaHTj/w
         jA4UgDmmiglNGEGiQtCzF/LxAzWzLrYKUxVulO6vA2BkdZAVS4/IPy1KZdac/34ZeVfl
         q/y4dq1OQR3w7soNLs7k1UdH1cHTGrGJvXWP40H7FZkyQfNSSE3oYM0kw/VboFPbkavU
         KhFqIQDUbNTVKqPhaaVdNC/qELxxNU3F2L5nmJJgQPh1DiQUSw4i0inyVT1zg6dBEiGH
         izcw==
X-Forwarded-Encrypted: i=1; AL+hErEGUcBHlRa2je4FLzFQOWmcNr5XEluzH21dz86gYon3aLDZ3UHSdq5LP4oQpO4J96NNXDwpT2U=@vger.kernel.org
X-Gm-Message-State: APuU4Z9jXbqCCY2/uibNjAegCD83TLwRO1SIFSPWExanVD0OGp5ywO1m
	WwisJznoHq9NtPxMAo2MXmPFfpKtYHpHI9vSNukbltW43IC0oCx0IYhtIypncShPel02AcEM11c
	tsWQU1hBymaym4w+Ms0CJLQU4dY572WxKDbK+T4kxtBH4xab51WOdN/0k46HZUr1P/w==
X-Gm-Gg: AZFdTZeE7kaSuLCH09GIgih0LNaBKu9/DpLb48cmmFgXyEbtve1gwJiO90IWe8UiyX1
	vA0l/Fo/BOFhxSBPq8lFmxt77hSSaZuT1cFfcEIVWHDWlISR1+1sjeQrcWJCT/JzGbpSeakV+ke
	/yZ5K1amEVZ4U2jgqh+JAjyCBAdrxXQ3Sy/jO629//DaYQY7BLY6/Ju5l5CmJnPQjtfaVhZ11OM
	sEHoUhZebPXlaOJCx0UrJWVYSLZyIb2n390nB0VzWpmIQXNk/QvqCnsQtRffxaoF14ue0+6aISl
	vtvhFJRxdGNgGHFUvLiToJKX4fO9eGZPEqPVQiBACLFAHOWWSOKp3+604zdZV5cvYkfSALKTU4R
	2IJGh+xYG6IFpwKKbXd7t2fY54w3eBzOsnq/kSL5OgX1Ia0pucAdRD25S5hpjEnon9hjmGu/MIN
	FUflgozMSs+M5OySIxTIr6s8QsnvS+G031KAyc0VX3URAC
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr588676805e9.27.1795769169947;
        Fri, 27 Nov 2026 00:46:09 -0800 (PST)
X-Received: by 2002:a05:600c:4f4b:b0:49f:fd2d:23c7 with SMTP id 5b1f17b1804b1-4bb888226c0mr588676055e9.27.1795769169471;
        Fri, 27 Nov 2026 00:46:09 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb906cdcc1sm401669135e9.2.2026.11.27.00.46.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 27 Nov 2026 00:46:09 -0800 (PST)
Message-ID: <a806ef26-fba7-4e36-a168-7b0b98bc0098@redhat.com>
Date: Fri, 27 Nov 2026 09:46:07 +0100
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
Subject: Re: [PATCH net v2] ppp: serialize channel operations with unregister
To: Haoli Zhang <26031212468@stu.xidian.edu.cn>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org
Cc: linux-ppp@vger.kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org,
 syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com,
 25031212117@stu.xidian.edu.cn, byu@xidian.edu.cn
References: <20261119084333.371234-1-26031212468@stu.xidian.edu.cn>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261119084333.371234-1-26031212468@stu.xidian.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/19/26 09:43, Haoli Zhang wrote:
> The channel unregister path disconnects a channel before clearing
> pch->chan. A concurrent PPPIOCCONNECT can observe pch->ppp as NULL while
> pch->chan is still valid and attach the channel again. Unregister can
> then clear pch->chan and release the channel while its clist remains
> linked to a PPP unit.
> 
> Serialize PPPIOCCONNECT with unregister using chan_sem. Hold the mutex
> from before disconnecting the channel until it has been removed from the
> channel list and marked dead. An in-flight connect completes before
> unregister disconnects the channel; later connects see the cleared
> channel and fail.
> 
> PPPIOCDISCONN must use the same mutex. An in-progress PPPIOCDISCONN can
> clear pch->ppp before it has removed pch->clist and completed
> synchronize_net(). Without the mutex, unregister can see pch->ppp as NULL
> and proceed before that disconnect has finished unlinking the channel and
> waiting for network readers. Taking chan_sem in both paths makes
> unregister wait for the disconnect to finish before clearing pch->chan.
> 
> Bridge establishment must also be serialized with unregistering either
> endpoint. Hold both channels' chan_sem mutexes in a stable order while
> establishing the bridge, and reject channels that have been marked dead.
> Unregister holds its channel mutex through unbridging and marking the
> channel dead, so bridge establishment cannot pass the teardown step and
> leave a new bridge reference behind.
> 
> The transmit fast path is unchanged. chan_sem drains channel ioctl
> callbacks. ppp_disconnect_channel() removes the channel from the PPP unit
> and waits for network readers before unregister clears pch->chan.
> 
> Fixes: 6a196e83a1a7 ("ppp: disconnect channel before nullifying pch->chan")
> Reported-by: syzbot+6b18da3ef22e33061add@syzkaller.appspotmail.com
> Closes: https://syzbot.org/bug?extid=6b18da3ef22e33061add
> Co-developed-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Signed-off-by: Jinning Zhang <25031212117@stu.xidian.edu.cn>
> Co-developed-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Bin Yu <byu@xidian.edu.cn>
> Signed-off-by: Haoli Zhang <26031212468@stu.xidian.edu.cn>
> ---
> Changes in v2:
> - Serialize PPPIOCDISCONN with channel unregister.
> - Serialize bridge establishment with unregistering either endpoint.
> - Clarify the chan_sem comment and bridge lock ordering.
> 
>   drivers/net/ppp/ppp_generic.c | 55 ++++++++++++++++------
>   1 file changed, 40 insertions(+), 15 deletions(-)
> 
> diff --git a/drivers/net/ppp/ppp_generic.c b/drivers/net/ppp/ppp_generic.c
> index 1a610a1..7b0bcac 100644
> --- a/drivers/net/ppp/ppp_generic.c
> +++ b/drivers/net/ppp/ppp_generic.c
> @@ -174,7 +174,7 @@ struct channel {
>   	struct ppp_file	file;		/* stuff for read/write/poll */
>   	struct list_head list;		/* link in all/new_channels list */
>   	struct ppp_channel *chan;	/* public channel data structure */
> -	struct mutex chan_sem;		/* protects `chan' during chan ioctl */
> +	struct mutex chan_sem;		/* protects chan in ioctls; serializes with unregister */
>   	spinlock_t	downl;		/* protects `chan', file.xq dequeue */
>   	struct ppp __rcu *ppp;		/* ppp unit we're connected to */
>   	struct net	*chan_net;	/* the net channel belongs to */
> @@ -639,11 +639,30 @@ static struct bpf_prog *compat_ppp_get_filter(struct sock_fprog32 __user *p)
>    */
>   static int ppp_bridge_channels(struct channel *pch, struct channel *pchb)
>   {
> +	struct channel *first, *second, *bridge;
> +	bool pch_first;
> +	int ret = -EALREADY;
> +
> +	if (pch == pchb)
> +		return -EALREADY;
> +
> +	/* Use a stable order to avoid deadlock with reverse bridge requests. */
> +	pch_first = (unsigned long)pch < (unsigned long)pchb;
> +	first = pch_first ? pch : pchb;
> +	second = pch_first ? pchb : pch;
> +	mutex_lock(&first->chan_sem);
> +	mutex_lock_nested(&second->chan_sem, SINGLE_DEPTH_NESTING);

Sashiko noted that the above is defensive programming:

https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261119084333.371234-1-26031212468@stu.xidian.edu.cn

and we don't wan't it (especially not for locking!)

/P

