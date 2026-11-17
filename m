Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794916935;
	b=sE6aUrhzuWG+7flnUZk/pItiapAttGOYAKjuiIPgB6uyef7aArvGJJzBVcJLDdyt/UbQ
	 srEAYTkcRLUcbQKBPv4TmYA+vLuldX7zbJNLM/7b7PbB8bBwK9f54gz33TCJ9UIkiKSf8
	 tCLgSgnOrKgxQWtduDIKf9pRNAachyd8ndz8xG0scfTF/ywHUu//uIbJh1qZqOQfDtHyl
	 uJcrp5ks8VXvCr16uCb/xYTOIc1OFAfgWvcBkutw8A0lz3GTiwhI56ctml1/2tXnNpUvb
	 p6MwYUlCjcS3GvwP+jd6HwMYUk76UhQfalTFCS68dG1YhX1PiLTtXYHFJHhVpmJWfNw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794916935;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Message-ID:Date:MIME-Version:User-Agent:Subject:
	 To:Cc:References:Content-Language:From:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=ZpBAZv/F6frjiYMr+e5uwax+5b55mYj5/5iqhQbyN+s=;
	b=aYZjAM18vPAdC+peJC1iLmvz6YmxbYT8LvmphEc80BgXG9KZCZmn+tafFobhHYNp1Oo0
	 k9QdpPXpqD5kxCQfJkHNQEKko3263mBDQeDsDYMneVoF4SuV3AnhZjXGyFO/WZrbeSdov
	 bJ7OjDjnguQw9oHZbRITPvPG0jbqoU7werhrG0Z0dUbaDMiO88LwFtxkXK5OnOYX0xIQe
	 GmEkgKoODgpshlrtAlXEj8HzE5GuoRlDVAts6zb3mWdgjC+V4wpeEot+tZA5NGM0d1onA
	 b5gbqaVS3qHR1uN7MmFycVfaPxkeNnHGCfuqrlnbVLEpm2Q/3Mndcyzd1RqeOblKfSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KB1Ujku9;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PZhFrElv;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DCB60606A31C
	for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 12:02:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DCB60606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=KB1Ujku9;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=PZhFrElv
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1794916933;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZpBAZv/F6frjiYMr+e5uwax+5b55mYj5/5iqhQbyN+s=;
	b=KB1Ujku9X8CWQL6RAI/S3cXdjMCxdo+cZ0zwPDcAbltMThDpBBJrcq9tDKtjfrnVsuz/6E
	1PpRcZgCz1MaU98kiROTN0osuOu8E6MRlbi5pZn5r+lFoG8XYh+tRUkoc1Lryg7Ep9vtUw
	Y35h9a1zlcOxAVU1Fvz1OwkpQdGqCMc=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-491-Clp458wLOJa3c4rCPdvqmg-1; Tue, 17 Nov 2026 07:02:12 -0500
X-MC-Unique: Clp458wLOJa3c4rCPdvqmg-1
X-Mimecast-MFC-AGG-ID: Clp458wLOJa3c4rCPdvqmg_1794916931
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-48e29c25101so2051209f8f.3
        for <netdev@vger.kernel.org>; Tue, 17 Nov 2026 04:02:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1794916931; x=1795521731; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ZpBAZv/F6frjiYMr+e5uwax+5b55mYj5/5iqhQbyN+s=;
        b=PZhFrElvvCkdnqpsSHsZ8xKH8YcgcG1AvrPKtpxehcC3VJVOoTosaZcbM+DeEaYPQi
         LXxah7qz2Nyfkr1oOkEOjKAaLDUDmqOtGnRpDi72a6jjNDGNXEKpE5+XQhyh1Gwc9euP
         DjhgjTrK13vPi2gmAc3hRySvlMXXJt8jSQZQf8ovctqcfGlXX8QzMy2eVJmo2MX/tYk2
         9VxoQMG5EAmr523P/uXnhiodxZTaj/9QwctKgGOLXkS9eo0LktbZ8+4LEobOTMefd4eI
         il6F/wgf0MBhPO+K5CkskwfYIA7Y4XW50E3NlikYy3iIth5WwwihMJ1EojWZVtJP6iEV
         SamA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794916931; x=1795521731;
        h=content-transfer-encoding:content-type:in-reply-to:from
         :content-language:references:cc:to:subject:user-agent:mime-version
         :date:message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=ZpBAZv/F6frjiYMr+e5uwax+5b55mYj5/5iqhQbyN+s=;
        b=bzv+J8DcCk+WAfN8AFU9hTITw5FM4FbzmNR+mP+m56sMTFrbGcGvfzQjR29RlZcC61
         DTdHnOpMmuIlyVqyIb7Grqdq71aK24bMhPTJ/HtgEwBMCI5aLar027i2RXjTkxGLoo2G
         cWW/ourfLx5vingnnoqczn3mE58tu8zX8HGB9xrWhUfxGLcBCEJNmYbX2aLAahkpmO+7
         JKx0WH5L4kish7uVFIOJwH6shoksA+wNOqFSNd63Bw/iYRP9HGQZFpxDWvFiiAQo226U
         2pQRSOTdgjMYFQQmJ/t29DXLdAo52U40fQIDbe6+c5yvUnXolQ3svrlmxk2rKUPfp0tk
         GOfQ==
X-Forwarded-Encrypted: i=1; AL+hErH9JVfZ8tmkcCyjnCQ5o7qQGf7UKkSrx8A0zQxeu+L+mBcU9t3EoEcpgUVbQSwtoDFWSzPPRCQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z9wUQ9yJ5JnnhDJLmcvZ/ZAeE/72SHhc5ES0mkwn3TGec8thZg9
	S07mQpxipwNpdKfM2MVjxF9BSxAUlWQvKTOimDws8vGABONIlJW2qN1JLNDyiZZH1zajzndzlPg
	f/3Sfs0nXek94oPe7dFf3Lh/CSmkRo94JBzNOQGTl7bPP0P0tf46AhcxRzg==
X-Gm-Gg: AYBFou1406e6o4TJWwoKTUofIWuzvwp0KNr4QK7nwJUm8ARhPHnDc4i07voCUThFhfx
	CDhz079bv8I4F9CuICoATOqYbVqoQLjNnW/jFzEbLC5mjmg/j5VIbebhNelJq6Wg1DYSWOYh88W
	9nD2ppo1c2OTTQxBCXN2WF6JzfMwVa92tEoN9zP5c6rYwKEd/W4ZTxJ/P48URWzBnh/FXyA21OV
	JvFDJYI0onyOA8LAf+PZnLeMToQiVDu76f4u8/kSWV/0+jiV9KPPDpdoPO7HExVywcbmw+Y0l19
	9flWx518aRzEpnsUoP6B8atqn1tLZ1AnHqfEts5hgPK2FS7FmqMopSzPeaEoJZGGR4wCjhFSvQJ
	0j8rFU11rv0SQZpjZWcuogPAzX42maYFxBI/ychpDW11r+6XF+XXuWAKY7uIcIGaUXuoIpgDkzz
	qv5XNqLJG1lz4aUNYJW5yE93EWC7SdeOSP/94vVYl+adaH
X-Received: by 2002:a05:600c:5395:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb55abba24mr291238945e9.30.1794916931151;
        Tue, 17 Nov 2026 04:02:11 -0800 (PST)
X-Received: by 2002:a05:600c:5395:b0:49f:ce78:356d with SMTP id 5b1f17b1804b1-4bb55abba24mr291238365e9.30.1794916930659;
        Tue, 17 Nov 2026 04:02:10 -0800 (PST)
Received: from [192.168.88.30] (ip231-128-192-82.pool-bba.aruba.it. [82.192.128.231])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a4dec730f7sm1974480f8f.11.2026.11.17.04.02.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 04:02:09 -0800 (PST)
Message-ID: <7c2243c4-8653-4c7f-b58e-7eba1e247cc4@redhat.com>
Date: Tue, 17 Nov 2026 13:02:08 +0100
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
Subject: Re: r8152: RTL8153 never runtime suspends with link up on a network
 with broadcast traffic
To: Paul Menzel <pmenzel@molgen.mpg.de>, Hayes Wang <hayeswang@realtek.com>,
 Heiner Kallweit <hkallweit1@gmail.com>
Cc: Chih Kai Hsu <hsu.chih.kai@realtek.com>,
 Birger Koblitz <mail@birger-koblitz.de>, netdev@vger.kernel.org,
 linux-usb@vger.kernel.org
References: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Language: en-US
From: Paolo Abeni <pabeni@redhat.com>
In-Reply-To: <fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit

Adding Heiner; for context full thread here:

https://lore.kernel.org/all/fba64030-4f1e-4158-ae39-bc072bc5751d@molgen.mpg.de/

On 11/11/26 01:52, Paul Menzel wrote:
> 1.  Do the RTL8153 and its successors support ARP and neighbour solicitation offload, or wake patterns, while selectively suspended? With that, the driver could program the addresses of the interface before suspending and keep answering for them, similar to what Wi-Fi drivers do with the ARP address list from mac80211. No new switch and no loss of reachability would be needed. If the hardware can do it, could Realtek add it or share the register description?
> 
> 2.  If the hardware cannot do it, would you accept a per-device switch for the behaviour of the experiment, off by default? A module parameter is surely the wrong interface. A private flag (ethtool --set-priv-flags) would need no new uAPI, and userspace that knows the network configuration (systemd-udevd .link files, NetworkManager) could set it. Or do you see a generic interface for a "runtime wake filter", as other drivers that runtime suspend with the link up would have the same problem?

This is IMHO borderline, but I think a a private flag could be the better option

> 3.  Is losing the first frame that wakes the device expected, or should it be delivered after the resume?

AFAICT loosing such frames is acceptable.


> 4.  Is power/control=on by default intended for these adapters? I did not find 0bda:8153 in the autosuspend lists of systemd’s hwdb [1] either.
Other questions are for realtek guys, perhaps Heiner has the answers...

/P

