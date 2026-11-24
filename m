Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.170
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795535848;
	b=W/fgjBPX2xo4MirBO5B4dRdJFKRigiE3gC0FOB0+f6b7MGE0YS1C+WMRcrG+FZ9yG00E
	 okzXX2cZ7n/jOhoDiaF8w3bZRtw3ty6qPYWnKzlIrvXU7Q9xYZOhOGeeRkuxA/A5DeFGT
	 Fmbwlc1iOTdf8VESig9u+NR3v/z8y17hLzfrYkSbDpDq0lnYiNb/ceDk2o6xDA65WC7TH
	 eNADIiGcVcQfaS2oPWx/rAe/hSj2nXTzXAAYJxPRODfXlGq3whxXmv5CU0U/+zdsU7rjW
	 91iVOt4pzcwD0JMBLc6AT+e6i7VwMJDsG38d+qcK0xs01vwEd4LEGpCQJvWm+8nP5rw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795535848;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=SE1nsMrgta2To37yaB6kw0UfmWIC3F1kCq7y1dLGMGc=;
	b=FfEZoScFOKU3NCket+fSNATZi87di6wmbOwXcCMNB8583vtFt9lsYNMBTFm+AWiVeNFs
	 uNmU0uxmZFZEyQ7xMcS9lp67LhWMNt0zgKzycu4kTYhy72D7F1XN2W84qj/1g6xO/fqr7
	 c2od+GIShYnFsKm1NfVrr/QO9otMqbuZUSAfnGwbPaSWiVUFiwpQtw8i9gJanJsUUthnE
	 vvv2Xgi97Zxc8eIHPgsxhfZXfA9PqvG97xHw4zEsm4ccGRDgotP+yWV4iJmtVY2fLbzty
	 H0cy6XSjlD5/QYHwnDCGM57dFJtHQrN4Iux2q4wEWNEt1QokQbWCU5nnkYnfUpvUz4g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LR4+4zTq;
	arc=none smtp.remote-ip=74.125.82.170
Received: from mail-dy1-f170.google.com (mail-dy1-f170.google.com [74.125.82.170])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7C9C606A321
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 15:57:27 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org D7C9C606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LR4+4zTq
Received: by mail-dy1-f170.google.com with SMTP id 5a478bee46e88-386c71feeeaso756225eec.0
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 07:57:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795535847; x=1796140647; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=SE1nsMrgta2To37yaB6kw0UfmWIC3F1kCq7y1dLGMGc=;
        b=LR4+4zTq3JE7fXvdoyyiTb1RLANv+d/7cK/+KErdvascPab5Fefx9CES+avAsrBgtO
         5+Ra/DbZgmI1gX+EBmuxDCrkH/o3PMHw5h/J+2KQNOXo4JasL+fYxPqo8NWjeydAOGCw
         ADRi9m/xbFIgox8JXi6cxO5/k0HFhXLsJFF8L8HNy7sSMoCA5wQFk0elV80rTyWWKu6K
         GH44Y9lO2ZIA7kGuYhsXwz3A5iyMjuQwb+JC4UAuvsIUQFhOjZ2RcyoSgHZeIlaehXpb
         +MeB/RmXvTcY4ADBwzX4owOzrBYS/lqIZ1clmbydp6qD46isECIgPxinFtQKGhTuxTBw
         65jA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795535847; x=1796140647;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=SE1nsMrgta2To37yaB6kw0UfmWIC3F1kCq7y1dLGMGc=;
        b=s+k9fI11mZhmO44k2R2gL6+ERf6jd38UbFB1Gv9hsj1/dpSEfGvRHTXjyJZh1QJlQN
         lJlbi2TodU/gDljl8V3x9nmuXMRqDuTUAWi+zzcU2qL50LU+kc0ZnogD7AB2p8llJg/q
         xcvMeayo+M/6+PG1ZBoyfkt2+KbDmV+4CWYBEpnjrzFYsizVZEbUVZIrHK0lulxToXuW
         MnJcqxsJaW7butxiHhNu2g1OBHed+sVc1Ag7Z8E/LcCqGbl3LQ85ZUPYxB5fQ6MKpYVU
         Z4AcApHS+GrwvHKGnc2PR4MOaRds7C5mcr6dLG9opGZRD2eKy9e/HY+GvJ1ONUFVeegH
         PXnw==
X-Gm-Message-State: APuU4Z+EIKfwd4VcjaSTr0QjS4/OQ3zDLn2ksJGRZDxEu+Vw2G1tymO2
	GUdx9QM9f+JW77O+09jMgiTE+9j7SO/YFjJuHtk7Pwjlv/hh8BkHwtXe
X-Gm-Gg: AZFdTZdfzHLkF/jGZVa5Axu9EdBCwa5Pc72Bb37gZfiV5knIUrglqSUGca0iz7+YXG8
	ZI/hn9Molq2eGBo7IbDcypUMl1zmU/fOGvJCaTO1v+8L78OT+eluSvM7WptnN2atKKp50Bd6vep
	GvnpgXo0NzozlxKEHyEOz8NZvVLsg2NV/8cH9D2CFx3KYMsj0l/ymskXaFuL+WV4lj5HLbcNU/c
	q1PVldZL8dwKcbkXz/U/sejtxGc9M3MLLKAkRKbMKQleePO97IjspguIDLi64i7njwqQ8UVrEg1
	NY9nLN7KvmOC6EFQoSaEHe15Am9B5Rbr53JpobEPYs1eHxDpBa3UlizYug37bdtNo/x1kpXLkSP
	iufUno5pGYWe95qi12uLSWzArP3p70dMDSX2N8HTeHIYJk8N9t6BUb/dJBzX0Zo3AW51Vrp90+W
	7LypwxtBXhItbHGvKNnWVj1oPdrQBd3EoH63Ml8nF3na1zezvKQm42etH88dGvRLP9dxHXD3Yyn
	CUVI4l/DUDFC0K8DW/9Osliop/69q9ofBuKyn9B5pwP0ZsuvMSmC+komO0I9+holIDOrN26ChoC
	v5yFdm3PX4axIUAmaPnBvS5tfx+10uETNm8MZXfX0Z0uAWk4FtBr/EzxzTCsvXMrYU53wAcmO0l
	NNTHs+D7pdMYs3vVe3LNHevq0pobcnds316xS5aqYYnxR
X-Received: by 2002:a05:693c:8211:b0:36f:202c:48 with SMTP id 5a478bee46e88-3857045092emr16376927eec.14.1795535846726;
        Tue, 24 Nov 2026 07:57:26 -0800 (PST)
Received: from l ([2603:8002:ea00:6800:e2af:cae4:df96:350])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-385677c0c1dsm50893933eec.21.2026.11.24.07.57.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 07:57:26 -0800 (PST)
From: Dave Seddon <dave.seddon.ca@gmail.com>
To: Frank Dressler <frank@dressler.pro>
Cc: netdev@vger.kernel.org,
	Stephen Hemminger <stephen@networkplumber.org>,
	David Ahern <dsahern@kernel.org>,
	Paolo Lungaroni <paolo.lungaroni@uniroma2.it>
Subject: Re: [PATCH iproute2] seg6local: fix crash when next-csid ends the command
Date: Tue, 24 Nov 2026 07:57:24 -0800
Message-ID: <20261124155724.2327086-1-dave.seddon.ca@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <a5b77684-1041-49ed-8fd6-567e68964476@dressler.pro>
References: <20261124055551.3390282-1-dave.seddon.ca@gmail.com> <a5b77684-1041-49ed-8fd6-567e68964476@dressler.pro>
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

On Tue, 24 Nov 2026 07:56:52 +0000, Frank Dressler wrote:
> Good find, and your change fixes the segfault.
>
> But I think the way you fix it is a bit uncommon in the code base that
> seems to instead prefer a pattern like
>
>    while (NEXT_ARG_OK()) {
[...]
> With that style, you would also fix another bug which is that it
> currently expects lblen and nflen in that specific order which
> contradicts the man page that allows them in any order.

Thanks for the review, Frank.

You're right about the ordering: "flavors next-csid nflen 16 lblen 32"
fails with '"lblen" is garbage', and the man page allows either order.

I'd like to keep this patch as the minimal crash fix, and send the loop
conversion as a separate patch on top, since it changes what the parser
accepts. I'll post that as a follow-up. If people would prefer a single
patch, I'm happy to send a v2 instead.

Thanks,
Dave
