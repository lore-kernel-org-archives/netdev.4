Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.remote-ip=74.125.82.169
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=fail;
	t=1795114788;
	b=EZUPPE0WRz2y/PMcHkJ/cNlmU7xdCJKr4RPQXsFPZo3O9QBSwQEUbpx8Gv4QZ+CDWwxT
	 hSxnvd8tflj9wzyOPgiZdAWOvvQY0ibE7MmeG3//D0a7FMAV5PMGV2X4KWyaZ2f5gEUSz
	 NtiJNWhGpecvwDlxGF2rrDrKbZ2zW4JEmD+Uxs73WvuHhV/YJV4cB2Aay4gLUzq/2MwHD
	 u2ek9+2nL64dTS8oEofvlqbj6cXz2HKzweNCMY4/Huh0h5bsREy9rHDxZo3U9xHcjEYIr
	 VwzH9Hl2aREBdkgX9IilL3KjopdTPmAxbdy4d0d+dNfpHuhpnmQxJrgt29gZ7bUHg9A==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795114788;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=wbxe7kLubw9u1wufA+gD9vxLgwISeFpqRh3SSGVI7cw=;
	b=Xf+HkawMgzlVFiddJUO46DtgixB1sgEg0PTAmBGS7Ap5C5T9gfWHv/sn9455bHVpDJFo
	 +DXq50ffNpg3kauajz5A+h8SewpYz0SGgv8HzIxUjrAqvkiWqPFbNQ+Md7PbioVo1UZsT
	 wqgJj+cp2sDhVuBckI1uUddxgJQ9pWgxUK8z1u52iZzCTBcJXAM3rR5S3Rog0cYwA+gvP
	 sjURvpQseD5SPET+kNAIhd7wtxjafREQMQWBNxkm5kZGG5kQpkGRw7oTVBx7NkeYlbVfD
	 Azzq8atgQhsGy5GoVV3xB5NsopNxP46s4e44bTiF16uh3Kyq604YfJBoFtQ0/eu3zNA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b06SVsdc;
	arc=fail smtp.remote-ip=74.125.82.169
Received: from mail-dy1-f169.google.com (mail-dy1-f169.google.com [74.125.82.169])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B9B68606A325
	for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 18:59:47 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B9B68606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=b06SVsdc
Received: by mail-dy1-f169.google.com with SMTP id 5a478bee46e88-380b40312e2so51842eec.1
        for <netdev@vger.kernel.org>; Thu, 19 Nov 2026 10:59:47 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795114787; cv=none;
        d=google.com; s=arc-20260327;
        b=K3D7nWa7lgvskVCumtNhvHcHMrqUP7RAVfj1hUtA9Io0XfT8MFTsFDBvsEn1ELxI5y
         /1v6AmYbKu1Ufv445IE/f97KS3qZqyHLV3wW+1gFgvodYhZnUuR1pmootKmrm3eGgV75
         c+jqK/JYMl9wqbiNkfMnmq2jdIMRIKjOoXPF6UwVqzrnzA+xd1BqAQVU8ILz3KGPDHPs
         hNbSA+LI69hzrWtJ6m230GYHKOyiWsqR9Q/i3t9RMkfsGmew9XHmAExzLf6008cjUf9w
         U9IX6BI9VhZPS/uT3npRa37HWlLr/uUysQNh2/ynIKklo7JRCiafszRTg2FxXZJ1aovV
         PlOw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=wbxe7kLubw9u1wufA+gD9vxLgwISeFpqRh3SSGVI7cw=;
        fh=UK7CTmhhAJvif0w30H8wwP3/kQlPof3POS32VEX1OVc=;
        b=m0Pz11EHYZU9d608h9NtaqiWkR6Qs8fCxG17VZw6kOriyn74+yHLJ1hk6TFWqAJxfH
         YZ+qC/QrKc4QBqp7lwcOcp1SHGf+Ab2TKosT676zQdXpOWaUMzyRA4FyKnpVtFpc3F+W
         6MeDTORvilhiq+uu7HnAklpZFzh3jSuMP7QDBMK0N1aWyNm6iLiAqfIygNjjZBicTyyl
         8sUTJJFq80z6qoBED8qhVknxGdNgjBtOSqS9jsNyQymhPCWtCnNGCjWUzYB7UaOBbXdX
         kHTmVL76wyVfKsIgWKW2a1QL/KF2ErSmTyC1/ojCU2vzkOqYXJ2YOBGG2HL39OOzGwmT
         6UjA==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795114787; x=1795719587; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=wbxe7kLubw9u1wufA+gD9vxLgwISeFpqRh3SSGVI7cw=;
        b=b06SVsdcaDcUIiqLafzT/utdQ/iCjsDIoPHheymBP14C9oVM+Nij/QnTatPmo5MLd7
         VWBwzL6foEyhbglKHqywrYsDot3ltlNUz3u3/RxZcXrSwaQqK0r7pphL3G80HqysQJOr
         RwuwmOjSc3g4F9xMvGEAuyWvzy3Ttht94JwG3wRz1UyFb0Yoehvd14U3X/FaQHODbnNz
         UbH54uyTHEJIi3O+qLH3rX689h1ixmJHiGMEmfZGg0ICYydBD9ccP+r2c39K7hFPbzWc
         IrNzaT5Z2aJKpIyzCz/I6Lj5uMjJ3JPS/SEhCliplYtOTnP13itNDhlUdUiBB7kCz7L/
         Cm+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795114787; x=1795719587;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=wbxe7kLubw9u1wufA+gD9vxLgwISeFpqRh3SSGVI7cw=;
        b=mG7PeQDyYBsv2/P60tMfZPB5IhhcHeWhQIx7uwTCVFS68t2MRfIUbyHXW5Ne+VILfO
         9iNLPa9Hg/MH60W2M9/S7hShdBYcf+Lrh1lize/JrSQfUm+FsDy3webzcOZajHx1LwZ1
         biyn6F3IgdEtB8N/nDc9LE9SF9ugbca+4O5depRYlD3CrYnJ4IkiDIPXhkklEo4CgjB3
         +9k1kG3yNfGLhxkGYogdGoYyTlkJ+/2SujOVoLS2gl4Im4nBQnMy7OdaPwG8F2ORmizO
         hGTCp9Lj1O3D7fI+QgRIqVfSeQNp2jo52mmIGQBteJii015c+V7Fkhyg+4aAP++uTlhU
         gd3Q==
X-Forwarded-Encrypted: i=1; AL+hErGeK4AXgHRKapuGbIGO9inepBY5uOEs1hJAGzLRFj9okXTBjJ0K//Agh9jA+b5erf0Df8tuWz4=@vger.kernel.org
X-Gm-Message-State: APuU4Z8sK7ve/1qfLNUk99Vdjm2wE90jecYm31ajBaWRGLh0GDGYbJ/m
	A32jGMMQXmpbImnI6w7511G00aRettO72h5xnD9QZ2UJ4tl+SGI4pZrzS1c3wNJq7Ffk+Lkg5O+
	FOQ63CENu55Y1GyIvz3MwKYLiZFz5VUg=
X-Gm-Gg: AZFdTZdSDU3pM0El9Kmv3BRK/rjsjgxYBY7F3zTNu9xgyeO/ykZiGb/NIbICZgGNcIo
	tdR78hwxUupANbwWB+NTuhAXQK1OHrC4AF6lWRQSVrxsM7lxyq/ZPDWjItjPABgNLpgDNFmLfvR
	E/t4e10xWXCyAsyXsFTXxqxpcuKDfLM3VdUMowQC8sTW5vbzYz1rxqjt3AAZ7Oc4jOs8ywevhVe
	3qBEHDByF/SjxLwdn06j71xYVbug3IOhbiiXSiHzXWcfy72r5fS5/aMc2TrHz1Z1leCIykOlVnG
	y1xnTLCCxPu4QQ77UhI6Tfn1OHb79vvWSCov5sjzewz0G/on6x4eED4YqjNoS0NfUWLAdVJHvEF
	YG4RQdMYok2HACoOJRwutXthatLxWMjjp68+pnjWFlkWnHsI1roZJHz4C2Wqj5oLd+qYOzKSNgl
	TwiEvZ99p1rnJMt1OwPQ==
X-Received: by 2002:a05:7300:f491:b0:37b:7bba:8199 with SMTP id
 5a478bee46e88-3856fd5cc92mr183443eec.6.1795114786784; Thu, 19 Nov 2026
 10:59:46 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261119012707.555494-1-lcy8047@gmail.com> <7e94f48f-f352-4809-a96e-d5363b8be273@nvidia.com>
In-Reply-To: <7e94f48f-f352-4809-a96e-d5363b8be273@nvidia.com>
From: Changyul Lee <lcy8047@gmail.com>
Date: Thu, 19 Nov 2026 13:59:35 -0500
X-Gm-Features: Aa3M54po2B1r57yvjEB-PRSHSy7gIA46Bx8WGdBCs9hXYwC8qE8ue_MB7q0s0UE
Message-ID: <CAKefsHt0MC47dMy++wZS7SJ_yZVYeOMdKmG8RvkNtqCoGn2_qA@mail.gmail.com>
Subject: Re: [PATCH net] net/mlx5e: Skip hairpin entries not ready in debugfs dump
To: Tariq Toukan <tariqt@nvidia.com>
Cc: Saeed Mahameed <saeedm@nvidia.com>, Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>, 
	Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, 
	Eric Dumazet <edumazet@kernel.org>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
	Gal Pressman <gal@nvidia.com>, netdev@vger.kernel.org, linux-rdma@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Thank you for the review and the corrections :)
I will send a v2 patch with the fix tag.

Best,
Changyul
