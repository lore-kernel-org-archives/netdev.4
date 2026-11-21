Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795290600;
	b=eNeCnJAnUCErUkxLx0JDcFZz5n4KMw2g3TtkqCkgUM/LaK1OiKQe6/6OtIa5NCYu4umV
	 zVdg63t3OvaxuIhSPtz1BRpvJcobnPgmqh9/wwydtwGs0WrtadrDPoN5/ZadfyBzU2jqP
	 ueWGQKFXJSMRFsaCk1aQ3XjuYbD9S6g+66f4+4oNpXdGF9qEFKyy/OuGHRkj45CbK2qya
	 zGqsWdD4vbZugE80eWBEdgQ1kN534EH6qeZZPkF/OSFkNqX4+IKvOZ/aTptwK25EDUMIN
	 aR5K0rnpZ3i8NnA0iTQK3JphVQK7zDDNGb7lXmfehWCbVN3y/qoIm6rRK6DFigtxG6A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795290600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:References:
	 Content-Language:From:Autocrypt:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=B55PFAs1gUxXgw4r5PiQ6FttK5ddoKsOqnyDzbrrjTI=;
	b=shc0tuSMG+Wxmlu5lr7NvavT4z7s+7zokm5PKttBanF2ySvhkIqTp6wahzp5FP8rvjek
	 crFPxCJz9a4RqxWNK1nh71lMPP386xBR6i7qyr9RRWWIqYow2CdRWePlXBK3Bm3LlRRZ6
	 tbYGUOoHQWkjXGPh9DVSj85AJzCkzV3C7xBiZjDdmMrcy3wzXrEFJcVd/E1ugMkgRD40R
	 pJZAkBMpKMbfRRfQrYyeVGME+EDrbCF9FFQg4Dt4D9ukHBStqOLB8oYoQD3c3vboWqFr1
	 TctxiIWf/77ODz6RfU4aehocF5J19Qctg5D/GS2kSN1WfiimNqh6Co+5LOv5RhKxEvg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=openvpn.net;
	spf=pass smtp.mailfrom=openvpn.com;
	dkim=pass header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=gibb6yLQ;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0DB04606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 19:49:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0DB04606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=openvpn.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=openvpn.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=openvpn.net header.i=@openvpn.net header.a=rsa-sha256 header.s=google header.b=gibb6yLQ
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4bb55cda775so12515165e9.0
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 11:49:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=openvpn.net; s=google; t=1795290598; x=1795895398; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=B55PFAs1gUxXgw4r5PiQ6FttK5ddoKsOqnyDzbrrjTI=;
        b=gibb6yLQCtYVl/dhwbijpSD0j45k1PUY6AA60JPnYeEWzxKDMsVXP3KoVCT814SwIN
         zX7f0adY3efEIQuGcxuh7udHRsIkilHbezL6Epw/L/A5+RphrtER1R/oCv+gBUNhCP+6
         uGG0HMTCt3j06dAbUBNcNnfEiYVeJ9CtnUDzIIIV3FqWDMzThf5dF9NtT9fkenGynJdz
         vQRMZ0zqyAl+SN5RUluLVWtd5c1KEYFB2nVdYqOmdRKbPI5tL1kqF+x+DJS+q5WG5H6f
         1C9oxoHxPGHIf5VdT3q15Ln8r89jGlnT2CTY0MBhPDrpcL8Qvcn1Xe0T28Mrpsj4FhSY
         Oi7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795290598; x=1795895398;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :autocrypt:from:content-language:references:cc:to:subject:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B55PFAs1gUxXgw4r5PiQ6FttK5ddoKsOqnyDzbrrjTI=;
        b=XeDWviuBGPR6n0cBH8O0s1UKDsO1O5mur2r8X1HTy6Z6edicGT+AbVQfP9xT2/CqcU
         UxLlxckNe38ysmxpheDezkA1GIwSjFakrzL/C1dlXaxQY6bds+Bq3+2/VCQg/qPLXiX0
         W/U7O1ADPFAMEkKNbCcV6Ah5+EYUntKadbmLNyXf3ccPezrL1snjsOVNxhZ/gTZWIPz/
         m+bSQSJCeA9/SUwUYMpI4UkCZut+AMBexid0pic7t+64bqrSJh2WBZF0pEOGgk5ynzQ/
         52b3PsAlW7bf5w3D2J5FV63W5P2CgdLtgexSAsaUxG5SWgflKdMmCOTVzwYkxs3mSFzJ
         SOXA==
X-Forwarded-Encrypted: i=1; AL+hErFS0einLqlDXknV6PrYgl8+UVTHSHcOrXBpzk4P1mKcsrGkB4YnUIH8jRMST3b+7qOCHd3sWZA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/0iM5pt/rzf6GlIeMl0rg6L1Dx1+P/m8tiQJVOAgKKgMduQ3lx
	b9yxR0pdwXK/oaWKaBdak9F070RpWhu5eJAH08xaGEr9aH12pQrVfZBi+Xof6uYy/JPVTgzfZGP
	FXjTpfRKVmaCHEOti1aPg/H8FX9WkW5ypT7XE2U2jpWHqJpmHwJqlU9VRQWSzlE6+5Ck=
X-Gm-Gg: AZFdTZcUad76foZf3yUy2oQ0tFZqNs3ZEtVC4YcpEpTZH7Pt8PTEYqtFs6ZHs9YmzJx
	scNjkFeF5Z6dS/N9IGC4Cz8daLbQdRSOhnj7Vy78oNhwMXz/XWzBUWAmau23Z5yTQ+x7irNldqw
	/EUWwL+Hal6Pi26CB2k35Y49NjBbc8xcdo5yZrd3neIW1EV+IqKsYLPItqAY9zh72+JXvIneiLT
	1c+0nfZEPBHrolJbCYxX33ISTDzE2BTVdBSdp1LQ61F3FlCRY6ZiClGsYQC141wVZJK0GGKO+wC
	SgpdZ0ieej3JngHBLUgwEBySKCWPlGWE/hQlFXp6OjrxJRuy7d7l62iLaW1rOuxTir6kBXMytze
	CHZw2S8aqWonAP5Oh6ogULZzxyWw0eCxHAQB+RjoFuuc0quwhUocprGRyPCmqfoPwyg06a9CC0q
	roNKCX55r7XLV1wkXRwQUWPSjo5h3IQrbpXaINGVFr7DEJygkiiilBtdk3JrWuo5DueaRQtBnre
	50pKF+TTe1ES6naEDMSTNG/mmMdEI9uHsVo+SbkGE9etFYywBH2xE/2DR24Vz7RFUOjfi32O/1i
	2I6eCzlNlz/TpB9T8ROzKuSgKd343rYHhzPHHUhu2YAvj5SbqdQRLWi3bcnpvv1D
X-Received: by 2002:a05:600c:a085:b0:4bb:85d9:156e with SMTP id 5b1f17b1804b1-4bb8880fe46mr153760435e9.11.1795290598260;
        Sat, 21 Nov 2026 11:49:58 -0800 (PST)
Received: from ?IPV6:2001:67c:2fbc:1:1b59:e18:b0cd:c525? ([2001:67c:2fbc:1:1b59:e18:b0cd:c525])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb884b7515sm275211885e9.13.2026.11.21.11.49.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 Nov 2026 11:49:57 -0800 (PST)
Message-ID: <21e78724-f262-4ca1-906e-390e26614a04@openvpn.net>
Date: Sat, 21 Nov 2026 20:49:56 +0100
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
Subject: Re: [BUG] ovpn: TCP self-deadlock when transport packets loop into
 the ovpn dev
To: Ji WANG <jiwangcdi@gmail.com>
Cc: ralf@mandelbit.com, sd@queasysnail.net, netdev@vger.kernel.org
References: <CAK5bSyAXjUmef-=NBMx_5+8C==FCQ_YVo0BGOss8ySevtnqHvA@mail.gmail.com>
Content-Language: en-US
From: Antonio Quartulli <antonio@openvpn.net>
Autocrypt: addr=antonio@openvpn.net; keydata=
 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
 ifS0+hzvnPVD9wXa9kdjO+0H
Organization: OpenVPN Inc.
In-Reply-To: <CAK5bSyAXjUmef-=NBMx_5+8C==FCQ_YVo0BGOss8ySevtnqHvA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi Ji,

On 21/11/2026 14:42, Ji WANG wrote:
> Hi,
> 
> I hit a hard system freeze with ovpn (DCO) in TCP mode. All input
> (USB and built-in keyboard) stopped responding, and the only way out
> was a forced power-off. The kernel log shows soft lockups on several
> CPUs, all spinning on the same sk->sk_lock.slock of the ovpn TCP
> transport socket.
> 

Thanks for your detailed report!

This issue was already reported by Bernhard[1] and I already provided a 
patch on the openvpn-devel mailing list that reached v3[2].

Unfortunately Sashiko claimed to have found something wrong[3] and so I 
need to spin a v4.
I should be able to do so next week. I'll keep you in CC so you can get 
notified when the patch lands.

Thanks a lot!
Regards,

[1] 
https://lore.kernel.org/openvpn-devel/auJj5Ld6uMjPb2eS@fliwatuet.svr02.mucip.net/
[2] 
https://lore.kernel.org/openvpn-devel/20261031225640.1436694-1-a@unstable.cc/
[3] https://sashiko.dev/#/patchset/20261031225640.1436694-1-a%40unstable.cc


-- 
Antonio Quartulli
OpenVPN Inc.

