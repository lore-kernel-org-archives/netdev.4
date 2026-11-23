Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.133.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795431414;
	b=SsZs8nqmArkUXJCYIVYCU1SsDM6kJwc9Aek24p62hMTYvL2xBpoW6o30n+e/ooaILmjD
	 UPaHJdMQ4k9x9KJFEV4QZadHPjX9UThLzmMD8aUoAhZCaQokaEWRaSBxn17UkOw/R9fzL
	 5zf121HU+Zp48CcH97Gv0YI4PiLwLnKoCUlbkH+4+l/CXxo7Bt9nbzfULGj6hCy0uRDPi
	 YI+u2sAG64ubQabigzzulA1gsaQYxwhGR96u5FSDv5otO4ZIrY+OEMeMCcCHAcxMa7IFk
	 j8iYczK+nU21ovVeGPfNWVzng0iPI0d5LAKtqMPHHMrMrPt8oIdOMu5l8kqBNvy0cRg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795431414;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=yhz1BaZJyup2+y9gHl3tJiv5++3fhydk0W+zQxSzg/w=;
	b=E7Dkf6UqYfA5trQXokeN+8mN6iOTBxmZAednoB92zvto1RPJY+chg3MfoaLigdfjATgy
	 kAcDvGdS28MmaA6RkR9qhOG6aax03LLF1YlybzQkVRcvskk7CP8SLeqRIckazapW5rO3c
	 hcU61tm35h1rvR4qXtYZRWGnicQOBNRIt5Yjd2DH/ZFmFVwtf/wBMwedVNPak+aryJ/5l
	 BRGmC0330QP0h7kQ0QGukSj6fqsuCM0F38fm8zLpIvrNhGHLWw7zkoqo3EAESoKvKsUfC
	 sZ6hFkoK2VsUTVpcZUqyhbo8+TVvExH1sYbfi2dbTISRrKFyGtNTo179Of0OsHTTw1g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V0an0vCM;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e5Sv9Md6;
	arc=none smtp.remote-ip=170.10.133.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB6C4606A32A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 10:56:53 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DB6C4606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=V0an0vCM;
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=e5Sv9Md6
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1795431412;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=yhz1BaZJyup2+y9gHl3tJiv5++3fhydk0W+zQxSzg/w=;
	b=V0an0vCMumlkeYat4asSEHMQ9s7GFfakaYxpjBqRarSrIpC0dM+RSrVr3xdsrzpTF8McQ8
	8QL70l8OSi2BKFiWYMHdEqiwns3Fxrp5XqfxgQ26UJqJ5KXof/CnHZ7i8pLvOxIF4EBZnl
	u04ae/WzevlHzsg8jxTpNyB4egHCPYY=
Received: from mail-wm1-f69.google.com (mail-wm1-f69.google.com
 [209.85.128.69]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-572-gTJO5TwDOmCpCZ32Htwbrg-1; Mon, 23 Nov 2026 10:56:50 +0000
X-MC-Unique: gTJO5TwDOmCpCZ32Htwbrg-1
X-Mimecast-MFC-AGG-ID: gTJO5TwDOmCpCZ32Htwbrg_1795431410
Received: by mail-wm1-f69.google.com with SMTP id 5b1f17b1804b1-4a204f135ffso15846455e9.1
        for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 02:56:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1795431409; x=1796036209; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=yhz1BaZJyup2+y9gHl3tJiv5++3fhydk0W+zQxSzg/w=;
        b=e5Sv9Md6GKX50PFxkzRXF614O6C7L5bLQjRV6BxF7Glddk8XXrYrZjgTzcmSAuEifi
         6ReejKJX/DnqzrXoNkMtg+894/4LKR4gAZo+M1ZgRYJcgPuwpSCD+3ffp+rZ7vA7CffA
         X/NPXQi25DI5/hIzcT2s2r5Hq/5+/U5S/kg5cuLwjvzhLrq2RrdMe5a4Nj1I+axmIYTK
         gqdTvnFWS/eJu+GUMJ0zI6mFkfqigOGXVRJwVqCpA2KSR6OW5GpVnF2eBcB8sbRoeCPE
         NtwGPFv5s9Q11xZy+nzBU4l0NbqbG2exclpd0xPn/D40fFlZVFRltRqDtQlu8GRQjuHs
         El/Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795431409; x=1796036209;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yhz1BaZJyup2+y9gHl3tJiv5++3fhydk0W+zQxSzg/w=;
        b=T+GI5KzHheYTiKptMuf45ckORuTaL4LvgP+AgrJ3xbH+h+pi8lokqqmN3YZ/oOSOJr
         fel8A1rHm7Rf0lMWedUswlt0zlfSleulPfkuWD3vR+pjsxe0LWUy3NrKVg+NtxAsM2Ri
         Eu//l0nLgq8ZCeBLxU096P7in7k8Fc3IJ5bIES5AKO52SGQeJnJ2dl/5O36A0F2SgmzX
         A+jzzbH70r6df4qPxN9+NLhEoT/shs4p6QodqXnJGoyw+XqHzuCaCXyoUqiIZVn2DCrq
         726/b5otY83mz8A5LAGD4kvYmAiEh8Ies7x5vDRSozHIh0O0lsQZzJ3TwYWXXkge0X+4
         XuEg==
X-Forwarded-Encrypted: i=1; AL+hErFUGjqBNBuI6cQcfo1V/fFLwXBlw77K7Dts6A60XTen1LjtlAUuuuEdCsfneYEbcGMRXMPsIWI=@vger.kernel.org
X-Gm-Message-State: APuU4Z9PXhkKW6uWSf5wrdCHGVh0FuwR0yOIapnFuWreDTnnA30G1q/q
	ZDOa77/fRet/VKISA7G81us6gP3LxzgdZmHHt74PQq6Wf+NZyRfn78s4ynhDsFnXx1AIpfTxt/r
	uNjazUIxd6zuHBecjoA4wtMzs4h+4OqCo4zrza8hSCz5tboVDnfr7j/iKmg==
X-Gm-Gg: AZFdTZfbcJ+W0LTeX4o4yZ14i6Ats1Huya67DKTAR2snIak4cNdFElZPxAuTwYce+j+
	mmfCOzOGmveW71MqyMggpRjFL0sRUZ2RQ9OnGjXClZS3cMb4BpLIfT8HevLxEabPIsXAe6bmKCi
	InrhhHIV0/mZrL/w69tNKs0LKpSzOvXfEvR40DLYx/niIK+WpfksokxmWCLS/l7nOx7M0vbxP+L
	z+l2/mIuzkU/K60xGPM+bJnJtfNoz3/w+jXbhtRc3YAjFH/4DAXk8nw7/HWdON52vV1qeChAIne
	+leW/YsWWxdEg1yZrw3Rv4U8cbNtPvSkqt0s9WDgRCkZdQ1l0QVwhCxf2bWIOahKwMqI3jvKn+O
	226e6iIJcL1FbryUuqfTsTT7HPYZbX5FJnd2NVc0hBu8Xz04nsH6gZQqf4G1V2WZ4pSjgWTNuFk
	j0nnJddVT/UxgaxE8+OEnd4QPpRwG/WE26cldEJ2gCV/5z
X-Received: by 2002:a05:600c:83c3:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb8880ad68mr218950525e9.5.1795431409614;
        Mon, 23 Nov 2026 02:56:49 -0800 (PST)
X-Received: by 2002:a05:600c:83c3:b0:4a1:7e77:c382 with SMTP id 5b1f17b1804b1-4bb8880ad68mr218950095e9.5.1795431409222;
        Mon, 23 Nov 2026 02:56:49 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4ab69bf6804sm21090104f8f.10.2026.11.23.02.56.48
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 23 Nov 2026 02:56:48 -0800 (PST)
Message-ID: <250c2bb2-57d7-4f91-a32c-8f6ac7d55a46@redhat.com>
Date: Mon, 23 Nov 2026 11:56:47 +0100
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
Subject: Re: [PATCH] rtnetlink: fix NULL pointer dereference in
 rtnl_get_link()
To: mdshahid03@gmail.com, Jakub Kicinski <kuba@kernel.org>
Cc: davem@davemloft.net, edumazet@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20261120134548.214126-1-mdshahid03@gmail.com>
 <20261120100415.363fcb19@kernel.org>
 <179525944307.361783.17801110279499293110.b4-reply@b4>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <179525944307.361783.17801110279499293110.b4-reply@b4>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

On 11/21/26 12:10, mdshahid03@gmail.com wrote:
> I tested this issue on both original and patched kernels in qemu.
> 
> First, I used a test module to unregister all PF_UNSPEC handlers.

Just in case the are any doubts on the poic: if you need a custom
OoO kernel module to trigger a 'bug', it's not a bug.

/P

