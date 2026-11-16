Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.172
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794849659;
	b=K20RGEur1AFTuHr9/6TTuFlj6piGt9rpKecEmK72Vl4gH+pVX0JFfHiIj4vJgFNre1nJ
	 98vKvdE8fNHGaywVtPv8b9UgcyAfQhGihudvqKMM2jejXiyBF+JhmXjE/fBgZRveQ/Ylw
	 rfnVgIDKc/HtR2mCDQRwcYv/uvJpRdJe2WTUJ2Nf85bLD3oX+0v5eD9+1cHC8Y72YEgVE
	 Uw4uBlq1Mt5eN1VJwN3N2KiTHrfho0XOAMl5FiLfDTOw1qfHw4vtTP4m/jh1YEPaa+X0p
	 2AshtB9V9Fl12vm5AvsEX+iSi+zH7CAqmTkGWeWbHBv+g7EBDZrEIapgU/Mba7eM7zQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794849659;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=MvOLlpJqbr24Mp24NMb935tnVNWS1SS/BaC17cN5cNM=;
	b=O9Rfq6QBf4IyB5h++jTdMFVp2lkTcUVgj/pbC0SQ9AyXK9GLP+P/aosKlW0ZdYQVvdFv
	 31lFvgv42afDP1cBZtGyD4N94Zyw2uYXoIMFg4KUkLM07TfvBq0U5RkqB/76ZMnM7pV8U
	 jmuHW46NPICLhyCaIXRNyuEf3tBQZCjkuJwW8s0ryUgw1WHdn9OxCAD6Nk/c4MrBQuHCy
	 vQPgFH1OW0N34atbe6LIDZ8vkNFdgkVKO16F/uOUXzhq4rd0Q9n5oyVNyrS7bOTIjUuR7
	 PUvUPELkFCteWFpKvMgxU3kwV4GB4FNyRA8J10lNPloOKkjQJQS0K7bQauqOFCkqkTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="dNwnu/jo";
	arc=none smtp.remote-ip=74.125.82.172
Received: from mail-dy1-f172.google.com (mail-dy1-f172.google.com [74.125.82.172])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61348606A323
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 17:20:59 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 61348606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=dNwnu/jo
Received: by mail-dy1-f172.google.com with SMTP id 5a478bee46e88-3712b6d9843so3010523eec.1
        for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 09:20:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794849658; x=1795454458; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MvOLlpJqbr24Mp24NMb935tnVNWS1SS/BaC17cN5cNM=;
        b=dNwnu/joVaVELGNto0fGpdCZhLuN5PZkpjRORj23psOL9f0WuiwRP7mNVRgwOPmDaF
         TIeHl7tWilPekWtgBIf6qUDDThmcaaa2VMiCgNM+xmp5vYZjVfXsuW/hgAJuBt6R1D1W
         x+RQ9M0/K3ZqkT/sSZJjzR60P21gM7xxkQ6OPlgPNacCDCKtIIrcDFn5QDsdnseo3lnT
         xO6Eq7dcvT3Qjrr2SGxRY/kYmvVxr/k/Y6E7BPolMTvc3CFBwtepOb3mF4fI7fSJ/uRR
         7qfwhMLMZBoG+w0sHSk1moATezLcUQadCzixONf2u437Tt4wDK4QixV3mcki3+2NOQd0
         uLWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794849658; x=1795454458;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MvOLlpJqbr24Mp24NMb935tnVNWS1SS/BaC17cN5cNM=;
        b=DY/EkpjmpOEcFq9fC5G7Udt6gpPlCvhYYmwJtri8iQNoPLYYu9CwA5EUzt6mL2C+En
         pTnxgNqlolDkImsweMDV1KGAhVxwllreouTDDf2HVwXbaQjusb9weIEzb+/k070FE7Pu
         /9khF11QWcTs/EWNjMh6uGXnqrbv92E7Y6F0wVATolz6BxqkWT2qXHZtorTdYqfI3Sf0
         oDvGegPuebuEwY15n6frd8WVzhOJpLk3/LYjGo+ZdqAZjh1mE2fPX/yTPlYsbnB/5+Cb
         JyUzWo5m/W5QffeDCjQJKxW9QOSxLN0lxID8/nGab6SmRTlTgGM+3BIzdTw3bX0DmHjc
         IoOQ==
X-Gm-Message-State: APuU4Z+8iRLYV+z2VTesbHyr3Z/uBsR6VBqGo5Bu5HqR3AdR0r/bYLnR
	2avKP7Td55Zt6u8IOHIF9dZj6YjTt+0dJEGtTUSOy3l2V/tzS+xFmlWxTQgl6w==
X-Gm-Gg: AYBFou3dDScVgb9wng+q7Ca8fhKk6hIlic4Q9ZzxC8mgPB4T9N37JYkgl3Q0kgi1oOq
	L0drhe8LwUM+1FkK6B9Ai0T9wL9NO56TmrZARRZ7eEoF2AKvR15HHMgY0mIXQzdBrtZsTG++zwh
	aGOks2pUGIB9t9BFl1kLowaGk+DBIXem6ug8YP6k0D3o3g0FGiHdh/NYREX84RCdPsOYEvBx3fY
	qijz3d91aymiIps16hORdT1Uuwhuqa7CitF8ePMCB0y0Hs5aJEdVXtuikurGb7eQxao+n3DWY4F
	r5BXxsGr/tHoER56IzABoh8O3qzrIMFt8Ic2yOCHc+2ksJuPdJJO6Mwxcn7mPWlN9SCiJqooT8S
	A+RINfYFoGfgLymw1WvrN4ROvFVLAiPmqgLxZiSpi/2qOAufinTxvCX1c0AQFVGkqG5wcN7Xzg1
	w3MFJq8zPOxGcB+vm+ajiRUlNQ1t5xW4Qrp+W8SnXjewkMnYk6sI6+XPtIoSiisXlrxDDW50rbs
	zLnRIy9qeiUxasN3KMasMluJMDBcAMgXoOAO4t+2LQGlSU5mLCOF2dtm0ajk65afQwhK+ZGA5i6
	6euTNHuTru6SwNxvpYb0nCjNc8q5Vf3QlM9hEr/VAQ+V+OCob4CuR51k5GGwBrib49uHux0k4HS
	hpHSC9DFrgyqFnyj1uHaJXND2Q3D3xQHZPrDANcn42HI7IjAFXHFt9Jm+WVql/A9RPVaAb7xe+A
	==
X-Received: by 2002:a05:7300:ff46:b0:37b:c89d:1d56 with SMTP id 5a478bee46e88-37bc89d354bmr5111846eec.12.1794849657236;
        Mon, 16 Nov 2026 09:20:57 -0800 (PST)
Received: from ramen-dev-security-2.asia-south1-c.c.ramen-dev-345017.internal (90.156.200.35.bc.googleusercontent.com. [35.200.156.90])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-379563e6b6dsm65024837eec.21.2026.11.16.09.20.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:20:56 -0800 (PST)
From: Anil Kaushik <anilkaushikwireless@gmail.com>
To: netdev@vger.kernel.org
Cc: davem@davemloft.net,
	edumazet@kernel.org,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	idosch@nvidia.com,
	nicolas.dichtel@6wind.com,
	jacob.e.keller@intel.com,
	jiri@resnulli.us,
	fw@strlen.de,
	martineau@kernel.org,
	v3rdant.xiang@gmail.com,
	aliceryhl@google.com,
	linux-kernel@vger.kernel.org,
	anilkaushikwireless@gmail.com
Subject: Re: [PATCH net v6] genetlink: Reject joining multicast groups no family owns
Date: Mon, 16 Nov 2026 17:20:49 +0000
Message-Id: <20261116172049.1617873-1-anilkaushikwireless@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <179482223865.3136.3369549991780791717@kernel.org>
References: <20261112094205.1120090-1-anilkaushikwireless@gmail.com> <179482223865.3136.3369549991780791717@kernel.org>
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

On Mon, Nov 16, 2026 at 09:43:58AM +0000, netdev-bot+sashiko@kernel.org wrote:
> - [Medium] The fix still lets a socket become a member of a multicast
>   group ID that no family owns.

This race is not new. It was there before this patch, also for groups
with GENL_MCAST_CAP_*. This patch does not fix it, and the commit
message says so. It needs a privileged module unload at the same time
as the join.

I can send a separate fix for net-next if needed.

> - [Low] The patch changes how the reserved, uAPI-exported static
>   multicast group IDs behave, and nothing a uAPI consumer would read...

Agreed. v7 updates the comments on the static IDs and on
NET_DM_GRP_ALERT to say they can be joined only after the family is
registered:
https://lore.kernel.org/netdev/20261116124030.1595567-1-anilkaushikwireless@gmail.com/

Thanks,
Anil
