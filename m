Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795606745;
	b=y/bu+Oq57A4tNtfQY4cO0YJtk3rhok+WiUPQHkrCBPHclX4dQkBIFU8ux/bhIMuVfqfz
	 05f+UM08zvrss1RN3u1KW9Cme2m+N9spTldyzu0Kolqd4pl3Y4MJDCD46nIK6+55yFTwr
	 E13FGnhDghsl0ZpcvUwIqPJshf3TRliJ053PxwCV2K/2GDJIXIXU5+yzUF9L/O7Mwgggm
	 E7v89D+Pa0b3gES9PCo1wq75ruOwHJ8iI1noitOW1MDICTYc8t3VNBBKZ+EFl7eshxU0c
	 S5a5TPwJcMwfF1pibRSIZopLcYJMXjuNf3GKSc8Iefnxhg3cvkQlPe/CAOfKIMHV9qg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795606745;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=MVWBICeTjf8qK83d1J+ekt2+KhQ2TiQiLz4B4oi35/4=;
	b=lOMNmK5CUIxobG47f3UJ9f4LIOFPP4NT+JSO6RoDeAXK9sKEuhdkfn6pIhzRBKMD/Fsv
	 f1TM54L+fXV5tdEGXWziPvZQf1MaozVeoHrepVs+/2VLy66JzcVAMlozL8uaOOGF+Z1X+
	 C1XNtQuXNkA0e3m7Yb2r7BmvK0HARiVr4e7HrZdi4HV5HE8Cx7eQYmDwe/1jhJq+AKvbm
	 r1OGSODRzBRA14bMNJ8CwQLn0cfd2JAv4PcGr0XfbCmbSO/xfzUNiz24DgdkLrz7Br6eG
	 A6a43zUNjZzE+ZGqYd65vWobT+NEy3eAEGvkoYh/eXF75Jlw6sBgcMuYaUr5zINGx9g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fOV73sjb;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rDEe25b9;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76CA2606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 11:39:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 76CA2606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=fOV73sjb;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=rDEe25b9
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795606743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=MVWBICeTjf8qK83d1J+ekt2+KhQ2TiQiLz4B4oi35/4=;
	b=fOV73sjbuarzCZOdYz0xuUx+25nR0y8eU5WwFxze2ZPH8THiy1cjhPabl1XZsNxEoRvyvB
	H10MrnDt7yQjqto6fq/4JhuEdVrzbLBFl6X18JaFbUK3KthsS6jXejJ0E6if5kZbYYcm2E
	cdNIUWyvDs+tHTRo5nZVnRdpdZFxlbo=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-622-Nq76xR9yO3SWzeyJqZYehA-1; Wed, 25 Nov 2026 11:39:01 +0000
X-MC-Unique: Nq76xR9yO3SWzeyJqZYehA-1
X-Mimecast-MFC-AGG-ID: Nq76xR9yO3SWzeyJqZYehA_1795606740
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-48c6a1d4034so3254589f8f.0
        for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 03:39:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795606740; x=1796211540; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=MVWBICeTjf8qK83d1J+ekt2+KhQ2TiQiLz4B4oi35/4=;
        b=rDEe25b9Tb6MiYVtOtS70qf9qM222Mm7/NgjCdRbtEuo+gLxFFNKWc8vOFfcwCe0Qe
         eEodUbK2T/gyueczGpyvuup/3kHGUHey16w02055R+wspZIJ5AV8IgT1W9nkvdT5s/aa
         i4f7SZUmXBLeaDsrhXqkEWC9gIpIc/RJUGbKcZlhrDjAsR7H6vfv+XiOo4mjJ8ZvqdxG
         bmcfP1rsm90rvAkjyCyuYkk8P64TTTG6gv271Bxb8Rby6X3zseASncUAcWyVkp7ZSkuQ
         t/ufDZxf0LpYzKF/sb7XfgIaLRm6Utx2OBj0oaMNAeZ65stXVJD0aZEXfSR2Q4/FMzbr
         MSYQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795606740; x=1796211540;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MVWBICeTjf8qK83d1J+ekt2+KhQ2TiQiLz4B4oi35/4=;
        b=dtG63jKOHz0mg0/uoNmas2OcL0ZIHuR7Owv6VeDEohPvPJNHdrRDeALDlgLgp64o1V
         rCtWEGazJEI72Rwfd/AB4Ql58CHGcKUDXdEuYienml2vUFnYdF11nMfkc1B3EE9rjjm3
         i4863rmfC0to5vrY3axWcu2IWOygPm5NdfxPTLsSLqS1zefCH4EQZWlb7/lWG5bQnMkO
         NRSAFV9gp/UYvRTFgBhQ89tkiY4RdBlzkR3WgbWYV9PzOrcOLYow5eIiZYDI3ttz8bt+
         /qRMm7YtLleUlV1d5UzcTuVF6jWpxfRMXZUtg0tbK+HJTlBIXCiuaIyamV2X1KWqF2JB
         MW0w==
X-Forwarded-Encrypted: i=1; AL+hErH1CKbuaI9zW6xhDcP9bBTKQ9DsSuOPLULf6g2z8c5WG4U8y6pDrfyFwAnT9GTnZujPtRNOxRo=@vger.kernel.org
X-Gm-Message-State: APuU4Z95xF9vDbGlpM7Cw7A78y15PLlkV5KcnQ3XhFHJDZJ8llAPMd+c
	xJhK8TPCsel+bUHk8vPWeN0prA4w/YchjNM1vYjLzOnoK/ZH39OVktmdhlRdgfYMU3Nj/Q8XIFm
	RcLjBhLQescgPKJAAsRYh/0vlSXLTOm4AvQhtmhk6eXyt43X36MNNMistbw==
X-Gm-Gg: AZFdTZc9Y6xXkqubQa8m+ACxmKSG5y7XbPVsn2gQCUUbEsSwXTu6lkRYKZKgMH/opjK
	oDVsKT9Y4Wmg/087R5mspod2gK9r1xelCOWcVYQsnVyqmeT+HGqRRfp4gMSjfebXomjlh/lZuzU
	BwxaetXNzgF7d55wokqouOhTL4lJCeTvfO5DSCwQMyW+an4okZ3iky5Ne5//4L4XVbUBO71ThYo
	xjEqEujOEbgO52q6keYM3EdJ99yTgqIbOCbrJyI5OfpDjEo7Nd+x+chBEzEEFwMNUFk/32pY5/x
	Mt6ingLjtbutwInGwhLifW9J5+a0jT6w9JxfTwE6j8njG06h8PkRrEs9TH/NZu3E2jWRVsfHND/
	wWzV6sca5BT/MUjJ31tnfxo00tlkHPbfc02S8mFzueOmguSO1RsmWtnUybw7mtnePWCeonrzu+a
	rt1+AgDhS2JWwp3lN+8mJ0cWQkGr+5QwtD6OmH81ag/83p
X-Received: by 2002:a05:6000:4025:b0:4aa:bcd2:c3ff with SMTP id ffacd0b85a97d-4abb71cbb6cmr29939008f8f.31.1795606739884;
        Wed, 25 Nov 2026 03:38:59 -0800 (PST)
X-Received: by 2002:a05:6000:4025:b0:4aa:bcd2:c3ff with SMTP id ffacd0b85a97d-4abb71cbb6cmr29938951f8f.31.1795606739409;
        Wed, 25 Nov 2026 03:38:59 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf680fsm38650991f8f.14.2026.11.25.03.38.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 25 Nov 2026 03:38:58 -0800 (PST)
Message-ID: <fdc005b9-e48a-4550-b66b-0f58db82babe@redhat.com>
Date: Wed, 25 Nov 2026 12:38:57 +0100
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
Subject: Re: [PATCH net v3] ptp: vmclock: keep the device state until the last
 file is closed
To: David Woodhouse <dwmw2@infradead.org>, Chad Aldreda <ca@modelmiser.com>,
 Richard Cochran <richardcochran@gmail.com>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>,
 Shuangpeng Bai <shuangpeng.kernel@gmail.com>, netdev@vger.kernel.org,
 stable@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20261119061517.1142436-2-ca@modelmiser.com>
 <1f77fa9014f8dfafb2be9cf15a66c5541880656a.camel@infradead.org>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <1f77fa9014f8dfafb2be9cf15a66c5541880656a.camel@infradead.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

On 11/24/26 20:44, David Woodhouse wrote:
> On Thu, 2026-11-19 at 06:15 +0000, Chad Aldreda wrote:
>> vmclock_probe() allocates struct vmclock_state with devm_kzalloc_obj()
>> and maps the shared page with devm_memremap(), so both are released
>> when the driver is unbound, but an open /dev/vmclockN keeps using them
>> through its file state. After an unbind, read() runs on the freed
>> struct and reads through the released mapping, and a poll() in
>> progress sleeps on a wait queue in the freed struct. KASAN reports a
>> slab-use-after-free in vmclock_miscdev_read(). In testing, the same
>> read() faulted on the unmapped page once the device had been bound
>> again.
>>
>> Allocate the state with kzalloc_obj() and map the page with memremap(),
>> and release both on the last reference: open() takes a reference and
>> release() drops it, and a devm action drops the device's own reference
>> after vmclock_remove() has called misc_deregister(). misc_open() calls
>> open() with misc_mtx held, and misc_deregister() takes misc_mtx, so
>> open() always runs while the device's reference is held.
>>
>> vmclock_remove() now marks the device as removed and wakes every waiter
>> on the wait queue. A read() or mmap() on a file that is still open fails
>> with -ENODEV once it sees the mark. On a device that supports
>> notifications, poll() returns EPOLLHUP | EPOLLERR, including a poll()
>> that was already waiting; it tests the mark after poll_wait(), so it
>> cannot miss the wake-up. The wake-up uses wake_up_interruptible_all(),
>> because no later notification will reach a waiter that the remove-time
>> wake-up skips, such as a second epoll instance that registered the file
>> with EPOLLEXCLUSIVE. Without notifications poll() already returns
>> POLLHUP.
>>
>> Separately from the report below, the bug was also found by a
>> Coccinelle script that reports device nodes in devm-allocated memory,
>> posted at
>> https://lore.kernel.org/r/20261106193517.3267013-2-ca@modelmiser.com,
>> and reproduced in QEMU 10.2.4 with -device vmclock. There is no access
>> to EC2 hardware with this device, so the fix has only been tested in
>> QEMU. QEMU's device has no notifications, so the poll() path was tested
>> with a local change that lets poll() wait without them.
>>
>> Fixes: 205032724226 ("ptp: Add support for the AMZNC10C 'vmclock' device")
>> Reported-by: Shuangpeng Bai <shuangpeng.kernel@gmail.com>
>> Closes: https://lore.kernel.org/all/178144969601.60470.14493569608271069160@gmail.com/
>> Cc: stable@vger.kernel.org # 7.0+
>> Signed-off-by: Chad Aldreda <ca@modelmiser.com>
> 
> Reviewed-by: David Woodhouse <dwmw@amazon.co.uk>
> 
> We did have a plan to pull the PHC-only drivers out into drivers/phc
> and leave only the *real* PTP in drivers/ptp. I kind of stalled on that
> because I wasn't sure I had consensus especially from Richard and the
> net maintainers. Shall I revive that and repost it?

I'm sorry but that conversation is way of my context window. Do you have a
pointer to the prior discussion? why such separation would be useful?

/P

