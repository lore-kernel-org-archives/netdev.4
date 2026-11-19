Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795080386;
	b=Vo+KOn5vftQirm5ze3JO+c+EdxjyRTsEIdCuejooJhW0GPzzWk2NcBOd40kpvYlC15yY
	 jNJNUtUmCGA/YibFT97vhlVej1999y63GIWooQqcUD3E75oLCNZvchckJYAW3XXkPitrK
	 7Kp4jrlrmms15lHMONFcb/ycktIeWPEZ4lsz3yFAT/3QIZxwGK1eXn+Du8DfSJ3WVDCv1
	 xqDBDmO6xNeJcBanuXEXYb0pHNmYR4gQFKkvSQUgSOOwXFdk1SqdGpfcomRFLHictCIRf
	 I3o6Yty7oJO+p51A9PwzunjyIzclrEbySGtP76YQAlA/gvwtSATcO+FaJXBLJF33QRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795080386;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=sNNFdNT6HEYh9rLHqtLIkV8KcrH/bODITiZ92EFcUc0=;
	b=cVFaXGhpaLcd9v270teu3h4ce8OG0GjHfatrbS7jntwG2sHhc+xIRCpOi3efKZ7ZvJgo
	 IjB8ZHHuvamPJED9iR+Z30nWfDcssNxl55UEOzFZvzqukLBkUMcUXEqXeKITK2803OiJE
	 CZAttNsg3Uh9sBZYIUlPYYdL+4ksvNBuZkrknTT8q/9h7qdm8fgYCVVJvKsah1X9SmsIc
	 4H6txJgMSlo51M5MOPJIq8PAyNnGdikWB4WJKJ4cdRZDtvOFZVAAlPC061NLbAYRcQiap
	 C3qkKcAA0f5Ciu5B6GErBdrKKNXgkbMGuYPWOwSngXttM8zSeZf9EMf6aDQe0XOYbEA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YjbnpZfg;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pjdywScR;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71505606A320
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 09:26:25 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 71505606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=YjbnpZfg;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=pjdywScR
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795080384;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=sNNFdNT6HEYh9rLHqtLIkV8KcrH/bODITiZ92EFcUc0=;
	b=YjbnpZfgXYGDlBJyPr8sHHNQXAYkGSRXRCbIYHR0r1AxXP1tK+XhNlLTLSMOpYdBReKgfC
	gv0cJftATwROnAbgUZYnbzMzOdxURFsyhC9RThCND4XkjhwoWqLWizbvvvbP6y3W1wJBAW
	PIu0OC9K0qsgZvLizf+elvF8DhZ8w6k=
Received: from mail-wr1-f69.google.com (mail-wr1-f69.google.com
 [209.85.221.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-442--XKFxmvFNb-Jt7nSUhI3KQ-1; Thu, 19 Nov 2026 04:26:22 -0500
X-MC-Unique: -XKFxmvFNb-Jt7nSUhI3KQ-1
X-Mimecast-MFC-AGG-ID: -XKFxmvFNb-Jt7nSUhI3KQ_1795080381
Received: by mail-wr1-f69.google.com with SMTP id ffacd0b85a97d-49034831bb3so1338394f8f.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 01:26:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795080381; x=1795685181; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sNNFdNT6HEYh9rLHqtLIkV8KcrH/bODITiZ92EFcUc0=;
        b=pjdywScRMDMU3RMPkBhEs4WodZJW3MUKvQKHXTJIZCjAMgX4EDKOktahjwq0wo1vje
         4dBlRhs9Agfxmy+DxVke/RJeMhqmfGjSlvOVQIUeU7vEo0HSFM2xKRpI1gR46NmGlvBV
         XDvcvqUbLxvrVnOo3ZtXfCBsXpLYQl+T3cE38nHk6iZf8XOdQitOcg1jQWuFgmJzYyju
         49gVE7GfyLQVGtThVbv7+l2idV1inpys29ZSFWuJg/I0WArIBRl/8zFW/gC/sAFiZunr
         daTvF4rC7l/7gH1GdDcD8a1fR9Ju2aEb+G28DZZOuu7jY39wffql7uzsM5JwWdOQFMql
         pnDQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795080381; x=1795685181;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=sNNFdNT6HEYh9rLHqtLIkV8KcrH/bODITiZ92EFcUc0=;
        b=seqTtGLqp/RwEft8i81E9HhhYM3Jn3fNyjwnEIdw7MkMJvAlLnXljluQqhX3Tp08WX
         aouPeTAZBvs612bf7mE4YQAs3GUHUO5zDbRX/RvrxfyQbH/c6DV8cbunc0Dk8omi3N23
         v0JyJXKWBgC4KTj0NgG3pyPvhf+kXD4k6HeSUNONJT5p/E02fwWN8JLcHm97/1JftUeg
         ak7/wXCxT4Tpp1GtG2TWH1zbY3DxCoEaO82L3TwcY0m0Qm+p3F6VntpJgDHIAusQq+Qp
         lSOybX9SWFp/fyZ2Uy49wG6kg7ZkdF9xN/SkT/WuadbC5Xc1lEIZ6zZp5/+kxAoRrGKZ
         gVEA==
X-Forwarded-Encrypted: i=1; AL+hErFeYJata9kC3chkP6uyLNt+xXMR4f0JbkTLv21CHSsqB9fyjakcwPrO5dWkItB3pynA0q14ce4=@vger.kernel.org
X-Gm-Message-State: APuU4Z+u+sVD7yzbKXJDzBDPnDfj0Px91HwYjoahUWiVl1hhVBz9FZmv
	zZfL+JsWYvy5IKXpa53dXjvZCsxzq3SU9OK/FvHFq1TV+cCWKXGqjeXCg09cVHAu4STf5zWAlJC
	j1MINePgBVb/k5CPDImIya5OuzIGsl9LHfu+jGOsirPAEnuV2b/3XFKnY+Q==
X-Gm-Gg: AYBFou2fkFQc0BAzzWsaQ5PNceBqPqwJYx02bq0Ni9VwxSHaIdjZJUyAPqkfrtS0DNv
	dhGFxOoRe8k/Wixjg2i2lHrpfXKLJbdilZT7ZpCKp7Dsf04JrgdNCK473FjJr+BUd7dnw4kf6nM
	CH2X+9JZQ0KOKCbeiAuym7Kazrscx0Qv0VXEbXodk8Ww9YQLupz4KzDB0L67q6pY7DBh0wZymYV
	ZuvN3/dV2TE3s2Kv1S5H0Oh/1QCUCdbS2nLHkS2G0u6sj8mrBxZlaRgVhtQR3mVP1t11k6MPj+n
	CyugK6pLiPk9/RzFLwq6b8LKRrkBTeQ6bUHS2MJYFxm/UatuUGSpBuGWVVtgRnFikvDU/PDGyrX
	/E3UOYI373Q2MXioVZ/wuQAHCnRzLPV5NOplQqY1ysrWLeCBmOWUaGTFd1JBKhNbO9qckZuWCli
	hYvkFfkMDPNIN/kWIEyxv5V3GEmsxbztOGvNwWqfCKgO5+
X-Received: by 2002:a05:600d:41c9:b0:4bb:7033:c938 with SMTP id 5b1f17b1804b1-4bb7da186f9mr87373065e9.14.1795080381380;
        Thu, 19 Nov 2026 01:26:21 -0800 (PST)
X-Received: by 2002:a05:600d:41c9:b0:4bb:7033:c938 with SMTP id 5b1f17b1804b1-4bb7da186f9mr87372665e9.14.1795080380965;
        Thu, 19 Nov 2026 01:26:20 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a12acsm23551205e9.8.2026.11.19.01.26.19
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 01:26:20 -0800 (PST)
Message-ID: <e57353ef-9994-4ec4-b831-05a4fa41537c@redhat.com>
Date: Thu, 19 Nov 2026 10:26:19 +0100
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
Subject: Re: [PATCH net-next 2/4] net: skbuff: don't clone a stale frag_list
 member
To: Josef Bacik <josef@toxicpanda.com>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
 Andrew Lunn <andrew+netdev@lunn.ch>
Cc: Willem de Bruijn <willemdebruijn.kernel@gmail.com>,
 Fernando Fernandez Mancera <fmancera@suse.de>,
 Mina Almasry <almasrymina@google.com>,
 David Laight <david.laight.linux@gmail.com>, netdev@vger.kernel.org
References: <20261113-b4-skb-segment-clone-fixes-v1-0-f777fb06f3e7@toxicpanda.com>
 <20261113-b4-skb-segment-clone-fixes-v1-2-f777fb06f3e7@toxicpanda.com>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <20261113-b4-skb-segment-clone-fixes-v1-2-f777fb06f3e7@toxicpanda.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/13/26 01:21, Josef Bacik wrote:
> Without SG, skb_segment() copies a segment out of head_skb by offset and
> doesn't move pos, i or list_skb along.  It still clones list_skb if its
> linear part is as long as a later segment, although part or all of that
> member has been copied already.
> 
> This doesn't take a broken skb.  Take a gso_size of 1000, a head of 500
> bytes and one member with 1000 linear bytes and a frag of 700.  The
> second segment is a clone that starts at the member's first byte again.
> With a head of 2500 bytes and members of 1000 and 500 bytes, the
> segmentation fails with -EINVAL instead.

I must admit the problematic layout is not clear to me, nor if there is
anything build such skbs in the kernel.

Could you please clarify? Note that in the latter case I think we should
drop even this patch.

Thanks,

Paolo

