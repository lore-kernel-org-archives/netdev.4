Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795300927;
	b=F4/QmnM6E2E1e7kZLRfZ88rzvA0YHZaGVwnMpmCal/8UjAG2eARpDF8OPiRUI/MCET6N
	 J5Ju661EY0tOx86q2FDIDOY5b1/D/54FDu25LFWBaKIz6Z77NDTaT9iKZvTrlhu7JrHnk
	 bgG3ew2deW3xPPcN0Ic2zb/kVc+DEbWwfOK/mLf8Pmf7XqqZG38VZYkmlK/E/vbfMcJeB
	 GIDIHAXPOPs4SVswBFPiDV7VUBtgFDfYcnDQx1KOT3t/QkEWp4ob+YUdkhLzhb1+5FJdd
	 AYeEQXbfKMSCy9pXbByIuMmL/Q+sO8ahHJE+GCP2FBi0buzPlNcZ4zvf+fltBFFbPkQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795300927;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
	b=aevbzCceoFduyKiJld49zyNhcu8w6+v2kAhMVfKZvqdqKJ8DKUG7Y94owaLsITQ672be
	 5h3QuRZeg4MO7iXIXADPXA0AJ/OTToMpQ5Jc4AYFoNkQshOuejKeqHOSqsIN5CniqdFJr
	 gjTLllWhl/qm/Wnqh1nbZJ+fbtq0uHCLGEy8BogDiW++2W0dXKDdtdRexEVqu5VoEFRh8
	 7pHOYgW5HO9VAMzEXmIi90wTtEa+d8Qs7E+KEanx9vEC0looUdYGQ6Fc6tLDNmRL4YlYP
	 awCmrgdAfnSdMsP0gVDXeu+rQOjTjwjt+mHplMbPOkD/bzejUDDHHmW271Y0BopElNw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="0axLW/PH";
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74E2A606A32C
	for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 22:42:07 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 74E2A606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=0axLW/PH
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4bb8ecdcbb8so1153375e9.2
        for <netdev@vger.kernel.org>; Sat, 21 Nov 2026 14:42:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795300926; x=1795905726; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
        b=0axLW/PHnotmGnAGvriUDC4zPVypUAFY7tABZ8TS4udy4Rp3gesnKf544GmlWlkSvq
         Dz0WU94DJEvJZAHvyDnh/FwYRdIQnMhzUYH5xXDSX7Et035M7FWb6nSBqjZ/YmeBBAWw
         LWlHWZKotM24upMg5sRrNLLpTrOg6pZDIFOE8DO9mnyDYjhKI8wUJzqiQlVRK7/2sgqE
         FhtsFRgAtArM/jmmbb0bhrs0U9kRRYzs0uHpInCW7Vjjw+kmF/iXFo/huHD1Y08DCSrB
         GAeijSHYKnDzfR6CRpF7UJFF0EGuufD7ohLNuTq6xWtMqsf2EeShpUbuZqfSMaq4wJHX
         b4bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795300926; x=1795905726;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=D2UwN6uj+eBii3DP4gkFy2CXb9ETeRwrQjxMZhSvZ98=;
        b=MF4KQeNTjm+gQ/4ZEXkuCPbvpIae/FR1wIs0E6zlmVFYXBliPb3CY2vaR109fud133
         WatLLvFkqC644OsFXYpjxf3Xl6NWRCrk057HQs7NV99tg++EVK+Rzj5PNjQ2O20iCJ9u
         nLG7i+VN6y2Ml+GbGINHf3QOjQKsxc+HqSUeZr58yrhUnYlcJAyjaN8D5wLMLrMw4oq0
         FwQXIVjSBksGB4J2rZ4GFhy+znUa+Ko4ZTgNt0Xn2UGpisRansmgBcPu5sx75iZ3MuJs
         wdDWIU6+VT6fY969W5ypb+KzZSQsrDIUetgJyp7uRs3muZKBS/Hr2rjiG1VgWSVAfOXZ
         fiNQ==
X-Forwarded-Encrypted: i=1; AL+hErH9eXVoQ+CaIcaacSl5BpqZTd2ZGXkqwuDfUqvBkTcm0oaeKgPxiW2M2mk5lcFhQbEtuV0NPjw=@vger.kernel.org
X-Gm-Message-State: APuU4Z97VAltPFbsbDRG1TL0pGL5Fp70VNvHJxAUAcmCRTvdNHGOLku7
	mLJ9sgmBopuLKSHzKoFNC4mbaPqTXyhn6dxdkVqBUCSamOnSsPN/lu54
X-Gm-Gg: AZFdTZd6aDwUQUxBu4QJR867pCtEQtzIO4P/nycIOjmpixJAAfGmIyHba4IdaX2zKE3
	rRTnpM+yGUhre4kRldpnvl9FaPZay7nyD0ePS6H7Q0F24EoafgtEDM5GwXp9dxQM8gBbV9euNSk
	YqeiQam14T4sT+gMVA9fuiUQKpRqF9/HpyfBaA2SmSFidUwUhVvsvJx831kK1pGQc0kyN8HUkkd
	hbAWwRLSeTAdoXinD1faV5mbwgFK9RxgmnllBavS+0HHHEuHe57f/o3q0NZruKSIK1by4InPJRM
	M4yCidtg091BI48ofRjn7TjoZG939O0QJsmhZLUzXiLeqYW21Ogp44t09y9p9A/XYPNdMzb5Gm3
	pPXnBKazrQgCbX3fdvbhS0ms5FboLG7ydRtY3yLxleOYLBHsSOwtqhFi/W2+oTdwVudH/uOZVfN
	dsEySXSLLZrQXMwMhH9dIyVRa6jQoOueoEMj8xC7Sk+vJr5L5UAXpXxtU16H9bXJjBp5u8gFsdE
	PBi6PvNe7rgIKp8x/XqKFyyAtVCFvUdUKNi6rAZ+DzMyqxiZW3PXtljC5USVsUfNg6AQGNnIeqc
	9HAQy/yGRhzg8qbR3qUH7biJWRPV1HvcxSQBi0MUKUOtTJlYoB2KpNZGYrsJD7bNyqjAyA==
X-Received: by 2002:a05:600c:154c:b0:4ad:5ec2:d3b3 with SMTP id 5b1f17b1804b1-4bb887f43d8mr151053725e9.1.1795300925668;
        Sat, 21 Nov 2026 14:42:05 -0800 (PST)
Received: from Nuel20.localdomain ([102.90.87.128])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb9067a0e6sm56649275e9.4.2026.11.21.14.41.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 14:42:05 -0800 (PST)
From: Omokefe Emmanuel Onanaroghene <emmaonana18@gmail.com>
To: tianyi@cloudflare.com,
	hangbin.liu@linux.dev
Cc: ast@kernel.org,
	bpf@vger.kernel.org,
	daniel@iogearbox.net,
	davem@davemloft.net,
	edumazet@kernel.org,
	emmaonana18@gmail.com,
	hawk@kernel.org,
	horms@kernel.org,
	john.fastabend@gmail.com,
	kernel-team@cloudflare.com,
	kuba@kernel.org,
	linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	netdev@vger.kernel.org,
	pabeni@redhat.com,
	sdf@fomichev.me,
	shuah@kernel.org,
	skhan@linuxfoundation.org,
	tianyi.gao@linux.dev
Subject: Re: [PATCH net v4 0/3] selftests: net: veth: propagate check failures to exit status
Date: Sat, 21 Nov 2026 23:41:05 +0100
Message-ID: <20261121224105.6288-1-emmaonana18@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261119012940.32838-1-tianyi@cloudflare.com>
References: <20261119012940.32838-1-tianyi@cloudflare.com>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Thu, 19 Nov 2026 01:29:40 +0000 Tianyi Gao wrote:
> 1. Patch 3 lost its subject prefix. It went out as "[PATCH]
>    selftests: net: veth: derive invalid-tx test value from kernel
>    max", so patchwork put it in a series of its own [1].
>
> 2. Patch 3 should come first. Patch 1 makes a chk_channels()
>    failure fail the script, and from then on the nproc + 1 check
>    can fail on a correct kernel. With the fix first, no commit in
>    the series reports a false failure.
>
> 3. v4 was posted as a reply to my review of v3. A new version
>    should start a new thread, and its change log should link the
>    previous postings [2].

Thank you for the thorough review, I appreciate it. All
three are addressed in v5:
https://lore.kernel.org/all/20261121182217.4609-1-emmaonana18@gmail.com/

