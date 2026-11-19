Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795076117;
	b=jjETZqqTc3kjLn22CVPEFX8XEschm35KJM+S3ljuECDuiOJPc+bMxSKCmLqqipgLjq4X
	 Zf7hSvkZCy6zMSm/iraNJvZ0/qOG6Sv3TN4qZxZPFsxUcXLPh96ac5gcQKBkctBEpaq9e
	 cfoKT50T6C7GUlFI2yasA6r8Da8uh9/mXKmS9P9/pDWHARiAXz5VO92Yq7FCTMaX9cZ13
	 eqcCvIqWV/6Nk3x0WgW7SSpx6wSvWiMDE6KFtXx9IMOKY+OMbb51Ir9Cbvrh7OTtoweoj
	 HGk5uNNU1q4qg5IoXgl2HiEyi9wacyloGlTiil5Tnam5msqTFSAHrEDYh57t82KSX+A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795076117;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Message-ID:Date:
	 MIME-Version:User-Agent:Reply-To:Subject:To:Cc:References:From:
	 Content-Language:Organization:In-Reply-To:Content-Type:
	 Content-Transfer-Encoding;
	bh=SbD58ugfokxPZmAa+sr28GhjcGo78uQBy/eh0bnkppE=;
	b=A329pBxtuBtW9HXlpkD+943yc32UFitz4qg1EJBloMG2gVFtLIN8lVkaNROtNH61b291
	 oFKJRqA+JIPAqH1VMq7dNwtT2kcxj4HKBZu55GqDroCfYDGiNkTD0si2R2ZmCmoon77zg
	 HklqyvOlRSvHLXK41UO/1swlRXvSdA3yP9GEQrC5ijAruDYuutzoqH30or+TRDr4ZaZTY
	 9X3WTOZpW01UevB4aRSidAMUfFIjsdNcxG+LvmSbW0rRxFqYomc7OZ10DI3ABWRRVCl1r
	 EPSoltVWz0lsOvxgJR4R9etRRd5OEwDS0uD2Ut4+RvE7j+FvQ3mLDJiGawPE9q7eIkA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=6wind.com;
	spf=pass smtp.mailfrom=6wind.com;
	dkim=pass header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=PQDADLkm;
	arc=none smtp.remote-ip=209.85.221.52
Received: from mail-wr1-f52.google.com (mail-wr1-f52.google.com [209.85.221.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D948E60A6F65
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 08:15:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D948E60A6F65
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=6wind.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=6wind.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=6wind.com header.i=@6wind.com header.a=rsa-sha256 header.s=google header.b=PQDADLkm
Received: by mail-wr1-f52.google.com with SMTP id ffacd0b85a97d-4a41f145599so134853f8f.0
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 00:15:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=6wind.com; s=google; t=1795076115; x=1795680915; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=SbD58ugfokxPZmAa+sr28GhjcGo78uQBy/eh0bnkppE=;
        b=PQDADLkmig1UB0qWSA/TIcTTyx7AJJGYESq4GRUMdjB/1kdiF0oN1HGPu0uelP8Geq
         xiyRIuSQzsvselPCmQy+aeRzgWjdmALrKfqv+U/+66B+kz19UrievEb71WpVFv/KGpop
         bDgk5rg8KztJ1MwBkWmrtKsOsYmpuhP93GAooPSrWLk876SJRpU5ntBkoq8Z63UFpm7n
         C0H6PF7eNDPfPBNkm3sPvT30yX9xJc3hsvoFar05aQstrEkfBXshjSlEBPGV2D1Jiv/L
         Z2zZaCErRkAECTHe9JUCpy+JZzEue+M24D5VZwwcPPnD+hP6EzpMcY3AGzMFe9MgXR3h
         CjMw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795076115; x=1795680915;
        h=content-transfer-encoding:content-type:in-reply-to:organization
         :content-language:from:references:cc:to:subject:reply-to:user-agent
         :mime-version:date:message-id:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=SbD58ugfokxPZmAa+sr28GhjcGo78uQBy/eh0bnkppE=;
        b=iIkYnTTAxJusN194nZN3OBFWNlNl8hzF7lVC1BC6y1YXaNPDANNTyzYBGJ5VwCHb3U
         cLVGRsSd5WxxYK6boMjQu6edpUuYVGI7pNopU0EptNATFnmk8geZ4UCG3+ZrxySYnR91
         LEwfTeF5FsitQwI5Idp9EPlfWRBZChWKBm0xfxONfA/INdnf71sjtZhBIMfQN4FbV/1t
         9V449Xrl9G+mekI01slar4xzEmhacPWRTB4eaX/e5ncOoX3TUd1MQSaSFyg6VitjH8Dm
         hLLhtruzh/peQ8JdvWmB1H2/5+ym6bP0zxgbhbEvtEPpCxicBxe/ORvLPIMgceFvNtJ3
         C3bg==
X-Gm-Message-State: APuU4Z+wXQqCcT9qmHjVpt7xCYYEhBktoftKgN14IxMjx/MIt0xFUxi+
	FxgEbWhz58ZPUtrrGr6mLT9YPsMsnejNfCCTEAX4n2PnQoa9K09LzJOwg+nbqDB3umE=
X-Gm-Gg: AZFdTZcM02xCfd6TnOoB40D64JW2BQ6FG5JuaCkTIu6/pngSMhXh2TnDmZTJy32g+nw
	FYEyk/6zIC5NQvi1fWBt8Bss3cNTbRMSq3lyXWM8GHrnp8EdBULZtUxlD0M4V8v6DkGTpz47FWJ
	Ybu2WzRoFcJMchksom0An6r206J3xPTEO/gTIvSCCThBkdtDXjTGVP2pyk94YkgWTUHH0AVqBId
	A4Ap8FA0TET+QiuB1jePDJZhNFAmnU7jujCzhz5r9MpVtUlmRmUqMjekILW0u65GHXKdB9RF4cC
	AEyIPQE0RcQgTLmINPCC2/iz3uRBoXvdL6dM7nGlim89Nph/Z8ItV8QeaWRFCq0ceSsguAvzLCC
	zk8OEQ+2IvGAkR9ARLiDSv1wDPx4C4YfEp34vivguP0JwZp7IbUp/SwoHIZ/qUKe+K5v+5+RcB9
	r8MHv9zSod+/9eahwGoIJ9ta/eVBphap6iHRdTwylg8s/YgAiw1zrRZnMnSOBXjsvQR+rg0CYHo
	SVdwvP0NHO3eJjacHvQyIOPHQtbfrSeUhfeK5abbbe09wAv6axUzDcIg6cG5IJqHE4VAsJLjohM
	iGiUkXlE1OJ9AWYUXEzDTn19wIPbBH+bbxpRwNB2Q8EFAkq+yV2VjUORS7ZHLETaxrJzoQMC9oU
	WY7flh/6l1exQLZo+ZWHw3a5bAQM=
X-Received: by 2002:a5d:64c8:0:b0:48d:f4e6:7b2 with SMTP id ffacd0b85a97d-4a63aa7f7edmr11571422f8f.3.1795076115084;
        Thu, 19 Nov 2026 00:15:15 -0800 (PST)
Received: from ?IPV6:2a01:e0a:ab7:2110:6a1d:efff:fe52:1959? ([2a01:e0a:ab7:2110:6a1d:efff:fe52:1959])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4a65100bf42sm8710432f8f.1.2026.11.19.00.15.14
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 19 Nov 2026 00:15:14 -0800 (PST)
Message-ID: <5681e42c-f8f6-4993-a8f8-78be39776a86@6wind.com>
Date: Thu, 19 Nov 2026 09:15:13 +0100
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
Reply-To: nicolas.dichtel@6wind.com
Subject: Re: [PATCH net v2] net: zero the tail of ha->addr when allocating
 address list entries
To: Henry Martin <bsdhenrymartin@gmail.com>, Paolo Abeni <pabeni@redhat.com>,
 "David S . Miller" <davem@davemloft.net>, Eric Dumazet
 <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>,
 Simon Horman <horms@kernel.org>, Stanislav Fomichev <sdf.kernel@gmail.com>,
 Yuyang Huang <sigefriedhyy@gmail.com>,
 Aleksandr Loktionov <aleksandr.loktionov@intel.com>
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org,
 stable@vger.kernel.org, Daniel Machon <daniel.machon@microchip.com>
References: <20261119040153.158372-1-bsdhenrymartin@gmail.com>
From: Nicolas Dichtel <nicolas.dichtel@6wind.com>
Content-Language: en-US
Organization: 6WIND
In-Reply-To: <20261119040153.158372-1-bsdhenrymartin@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Le 19/11/2026 à 05:01, Henry Martin a écrit :
> __hw_addr_create() allocates entries with kmalloc() and initializes only
> addr_len bytes of ha->addr.  The dump paths emit each entry using the
> current dev->addr_len, so an entry that was created with a smaller
> addr_len is dumped with uninitialized tail bytes.
> 
> dev->addr_len can grow after the entry was created: tun's TUNSETLINK
> changes a device from ARPHRD_NONE (addr_len 0) to ARPHRD_IP6GRE
> (addr_len 16).  On v7.4-rc3, with 64 entries armed on a down tun device
> and the link type then set to ARPHRD_IP6GRE, RTM_GETMULTICAST returned
> 16 bytes per entry of which 37 were non-zero and 21 started with a
> kernel heap pointer (e.g. 0xffff8188_04857ee0); /proc/net/dev_mcast
> exposed the same bytes.  This discloses stale heap contents to readers
> of those interfaces.
> 
> Allocate with kzalloc(), so the tail is always zeroed and a dump can
> only emit bytes that were written or zeroed at creation.  This also
> makes the explicit ha->sync_cnt = 0 initialization redundant.
> 
> Cc: stable@vger.kernel.org
> Fixes: a748ee242681 ("net: move address list functions to a separate file")
> Link: https://lists.openwall.net/linux-kernel/2026/09/10/320
> Signed-off-by: Henry Martin <bsdhenrymartin@gmail.com>
> Reviewed-by: Daniel Machon <daniel.machon@microchip.com>

Reviewed-by: Nicolas Dichtel <nicolas.dichtel@6wind.com>
