Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.182
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794711435;
	b=Cjm266A+AFOzdGcsH+7ZPpHousrqd7FvaIP/QO5cKlOfgk7W5rghOUxsc3avF5128j5G
	 LIXVvNQLlXEV3S7qFyX+Y9zZdLq2/rfp4xHJks8PCvbZ8ZYqO0EEayM+Yt9gXNS13aFEE
	 4MojaVlYOCHNV7UMfAcuqHhmi5IdLuRP2ORE1HmX4ZpzCK/UBqJi3WJTrxO8wMpc/38Il
	 5L8B8gx+Ul0mZaQCq8xFwiBUKOkSlLTfPqFTg5dNMnp5d0/PRq5k03HNkXY+R0USV7O73
	 UUmvEze0i2C4rhoQZnj+k65QutyE2OX0eT+9aZ2AXyKKvK0pkdyv+h/t5Ts20Cziwyg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794711435;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=k8oz3BQ/HZy3PG6rhWbidZddgjCFH79voNOxMT0Y3dQ=;
	b=lnlQhhxoB00A30O9k5QH+UfPfcLugLfleMuI4A0pBRAZ1pIP9AKeZQuvIoCL+Eb2TYar
	 fqYeRZippd9zZIrjBaBVU/QbArDfoFYaAyESJTeg+NIjU/p3rtATwybTuztnUij1IY/le
	 QwJ0QNrDHSqIjDsjbWHuJMUUGhuFK1YnvyxyQX1Dw7/C4Gk6DrUWT8O9wXZVvxzmhekKr
	 uI9PVYeqthvyxOfRf0UcRLIQP4oQUQ3wzMA975khQZfoHekrvTwfdU4SFXGH4BF8adgjV
	 EY6p1CQl16+fCB90862o02gKsyi/ipcKHxBaUmPH7Lv1j+LNqAjgAj6WRWWwGewMDDg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBMlvkKh;
	arc=none smtp.remote-ip=74.125.82.182
Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 48F8F606A329
	for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 02:57:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 48F8F606A329
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=ZBMlvkKh
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-37628596783so3970856eec.1
        for <netdev@vger.kernel.org>; Sat, 14 Nov 2026 18:57:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794711434; x=1795316234; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=k8oz3BQ/HZy3PG6rhWbidZddgjCFH79voNOxMT0Y3dQ=;
        b=ZBMlvkKh6cHMxXN1iorhJZvHD9gBK9TBMWMt+LC7sdr2QqPGNXiCfTeRMXsXx5+O0g
         8ejKHCnW1fTPGdI68XmXTQMxhNplXK1zADJaIzkFNnmzIg/RAZWX8Jkom5nt6Hkf5mRO
         wxE8x3FFZBi4mQ3zHgE4yLEjtU+tYmVjCbSTRLesAT2Y2OE7vCVc2vDKP0j6jdsrs1In
         KcL9BVLWGLT8D3dG9tp10fCXqVs0J3r7ut0vEL+ApmBzR8d8FL5XijHJMCOtkLhv/HDK
         k3cyq/JpxidJopJ38WYoZEN9zCRPRoqF2LVTpu+QMajWBfNE5aYdUObD4BXARYLogtzQ
         xXkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794711434; x=1795316234;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=k8oz3BQ/HZy3PG6rhWbidZddgjCFH79voNOxMT0Y3dQ=;
        b=1MQ7V6OfjA5I0y1eXxEOiCzj7T+O2k/lsGX2bz/xFDfTmB7JRMDfIywZ3ub9kGwIMD
         apXuXEyWD7PFG7/IEOiiVGAuuQ61XqexrgxuelBBGYozY3+baH80mv44wWDz9x5EHclD
         MN6xK3dwAV938E1Ojhoj0dWDg6h1aSlpf2msCcDTR+wzLhlfaVrkFJifqA63ZH9FgYYE
         bijtiPM0HwnNCzqzHbHt2G0Ylk+r5lBV6Vy8U4KQUrkguxDzlpXp+feLr5vkPs1bLICj
         pzwp5Y1KBJpPMWDaoYZ4ZZUrSQDMY0b5o5hJX5dFU/dD1YEBrJhZx/XKL/bzr6fPlsaF
         jUjw==
X-Forwarded-Encrypted: i=1; AL+hErFPmNtSI1zBGvJOjq4+AXfHQKb2gcRtBUzQVTQyJWjU6KMA7gTCi7W1CWhSPoXZWM+WwhTlr5A=@vger.kernel.org
X-Gm-Message-State: APuU4Z8HhMdmor7PkMGi4rDPgZ2BhbfIj4Tqs9+oPXDMkRXoaW1wW6No
	FuSXhYrYOTQmdzbzXsQkyUmOd1NnKmBULzf9RoYvbt8SxJ9LbiJBVd+q
X-Gm-Gg: AYBFou0o/VXNco6hduiJRDfC+Lv0rQcf20szYmMsHjXwynRLAZqrblQH0+4b2QSOOuc
	xKaBPqJY2pqZ5VUlUsWB/ZKuaSxboYbX90IuV8lyyo1Hj62o1jFXAtIMvEesx4jNnhdTEFtgvN4
	RASbwtYVKoeScRE2P/vXDHR1uE+pS3e03dTI3p9ti+hbLCwgFu1ghuHJQZugihmb6Z1cWMi83tt
	eainONTsXfKvQrcwU9YWk/LBmwlQfvZTKBvu4LAgoVOugnw/4/AUlaR1ei59g1TMhSzTPjQLzhk
	KceouMwKKUvdiNTuSJw5fI7Q9MFFkx3pEfT3d67nFGFUvAWV5hacPqOrwYlTwQ1XU9v9oA2J2Me
	QTPcglaP7h1AwSj0T1Km439m0lFwi/Mge+Vsv1yF3tDHPjXh5PfNGWSmLJBk3+SQTEdzIJIAxR4
	6QYi93hJ5875ESDQAX4OmZ7De1bDmnNCa/SPJ+X0wg4xs10mGpOTvr0Qhqu/VZQsoXX9IwhJVuy
	5q9HRKNRMzqmt6PzNldBIckLScv+k6LBX+C9MIVyjWFWTQBGVeXrw+H5YFn2zguiCT021xUCVP4
	uLbIJcBegz6OlpGs8hbmCo2NRScoNVV/i3Q8fIoDILylRhhnlRoiB+7OwspCHf1EGwIJSNE1lfP
	Bg58fM00aKsn0aWP4un7L5+a1UIgWM/JDAPa0gG2QKOVxHSHkbfiwQGFQoTbh6NXXuCVzOWIKgw
	==
X-Received: by 2002:a05:7300:8248:b0:36c:a084:30a4 with SMTP id 5a478bee46e88-37966960b23mr6871516eec.21.1794711434128;
        Sat, 14 Nov 2026 18:57:14 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955a1c5c2sm22022472eec.14.2026.11.14.18.57.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 14 Nov 2026 18:57:13 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: nicolas.dichtel@6wind.com,
	netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: Re: [PATCH net v6] genetlink: Reject joining multicast groups no family owns
Date: Sun, 15 Nov 2026 02:57:06 +0000
Message-Id: <20261115025706.1441789-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <2a362c31-2659-4a5d-a7b5-a50f646020b9@6wind.com>
References: <20261112094205.1120090-1-anilkaushikwireless@gmail.com> <2a362c31-2659-4a5d-a7b5-a50f646020b9@6wind.com>
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

On Fri, Nov 13, 2026 at 04:11:05PM +0100, Nicolas Dichtel wrote:
> Could these tests be added in selftests?

Yes, I will add a selftest for it. I will wait a day or two for more
review and then send v7 with the test as a second patch.

Thanks,
Anil
