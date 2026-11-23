Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.219.54
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795394938;
	b=2RmCQzAgtjxcGpiFSA35Tmh2V61BrzomkaedJuQYFu1skZcXnHFpwPX4BY4CyUtBiOXF
	 GdBQEgqvnG/dan3CRMDz8cNxunRZEL8Yx9ybtSaRCt6XajUVBdaW9v4+p06kYes5jwf6N
	 gDGgwzqvhGYfTb4NIPm/d7BUBx7COSrPB76VyEcVOAHWl07Oe+5CQTZ862jhMwxGM68/K
	 XHo4od8XqAvTBZ4vFNRJnEjTvCgU5e/wFf2cQ7umY6AjG/dsn8Zf4U6ytQwL/ogTsk3Ly
	 hvK8LLEcX7K112ZQJskY5zV8S9TspaEIhWY+EXJZSShEVQNdZOhxjvYz7pZYxwBRGfw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795394938;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=XkB1/D3AgiE/513YaWxpzlpuC5tZ2ZyAh+6bQUBtanI=;
	b=ZSumiYaGgcYF1Iy76DDOeSKce81P6WK05Km4f+GWV4nvaEJ8DK+LdqEXfGZhjt5Ckemf
	 wcFXk58kz2ToQAFzkgrdpbXAZaYQ0/diJAyb5bWWLR5RXEChktrSAve+pizhozAMT49Lm
	 VLXrgXATi8+PJq6V6XKU/RnbJ3F8bKtBfdRAFIdCOszd1hAYztbfa9OGZilkGolUKF9OS
	 LbcnXnmVBDrIKxRxFlV0Bipfwqm9vor0p2bNndL6a30HMWBE+d6Um+XzHy+KMgPnr/hqY
	 C/8zSF2ihnwnxTzOSTN5AuTwihQZo90LK656FcSBepGE5MknI4CGHbGLZ9Gb2D6U8Rw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yv4KZfCQ;
	arc=none smtp.remote-ip=209.85.219.54
Received: from mail-qv1-f54.google.com (mail-qv1-f54.google.com [209.85.219.54])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5596A606A31A
	for <netdev@vger.kernel.org>; Mon, 23 Nov 2026 00:48:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5596A606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=Yv4KZfCQ
Received: by mail-qv1-f54.google.com with SMTP id 6a1803df08f44-9213fddb596so32749056d6.2
        for <netdev@vger.kernel.org>; Sun, 22 Nov 2026 16:48:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795394937; x=1795999737; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=XkB1/D3AgiE/513YaWxpzlpuC5tZ2ZyAh+6bQUBtanI=;
        b=Yv4KZfCQcO/Uy3EECBrqPMwu7OhIBLjYRV+wwYftbhQybdJ81AlyvFmnYfeMLgi4ai
         fWw/OAbJiRVllxuBWeqkpNywfiGahml9PxA5nzIhP6VXXB8wzByW7ddbm0Eu7YGsIqdw
         Sr9ndePx+kj+L1M3g8dbC07LlK5zpu4Gbd4FfH+nOFbiIjLB2lIf5MnZw7PftSlmqdkK
         4HSdH5vDRLBsTwL/vSNx04Klgz7r20BhopWwcD+L7Ayt7mmfMruh1BSY3P7KteCc7UIa
         09XhNh9o+GqjiDB74SXB5uC99wIhdo7Bgf44XYBxP6Vf9IaxzgJaJ6ogqpDwulDkwxUI
         ztmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795394937; x=1795999737;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=XkB1/D3AgiE/513YaWxpzlpuC5tZ2ZyAh+6bQUBtanI=;
        b=ZnlDdKxzX9ihjnHy5odrIyvT7UVD3Uuo6vungkvs2lBA34QdRHNz1UtvWtEUzfpPQ4
         hShW6bMM705D12N8gAtCPPYeibuJ8vZmiXhUBYbvwdDEa5+Lw8k19UX6VABZ/wbtuplu
         Y/PcUq3HE+KAeKooo4jQ9LeytpWkCzydesZdb9A7ABfzRmk/129P/TLBcW9FFbZNOYnt
         UqIWQ5qJOA8pk9c9u6NtgqO4MYEazieiTKD+x1p5JBbGHgxCyzyq1/gbxlTl85g96qaW
         U0Aqr/hyQXDqUhvm5jwyv6/6OFvBw0payRqcLcmzcB7+OaVY7SiV5Tk8x+1XZQY6Hhse
         JBwA==
X-Gm-Message-State: APuU4Z8Y2t6ONN6RPNh9Eg8WaZ+n0uWhM+3fBzJZqWicKre5WFwJlYWK
	hr/kqiToGmwVi1HJFQ8M4joWMmw2JCo0SMnN/oX3ntebTyLnma1Mo/8GC33+Z+Vn
X-Gm-Gg: AZFdTZdTcqzbZjPZ4E913on6Wt6e89882kB4B03AaTiCm17Nrh8n32nfnaj4i5MsWyT
	uVcASMlzNfub+GF/SjGqVzAJO14ZwLkCtioH+F81l5FQu+WcWujFVex+FAS2F8psF1Kz2upZMVD
	jSD2Ub4pXnJyhz/UemN7OmH77A/Rsd8FyiAx3+6wz5YZOzh9Rrpw6lD8v+tGAmd5PgkKEUjPefk
	g3/MZ0+OcsHiBGL9Rz/ORH006lEbuN5LfZCf85bRX9GPgefFJWbDWN9eDX+K3EfH6J/XwAE+Bc8
	HBH60N1U/d9yATTRUyeZvEf4wuxNCRhh6uw5wP2Ev68UZN8hUov5lgKStVB0q270Lo2P/5wdSvU
	hV3ySljWGm20BNDszIhgQossKgyhX8Teq3Kc9OWpp3l4Ep0f2OvqqAT3LKUOC3legSouTTiqn+E
	XRbsde7NxPyCPh8pKjIjj1DRTuGmyUNMLxvn+f6DWViQGfujXWtEYy/xVcEt03cuCTrtLpFKE8k
	niBIzUFLYyizk2BsEOl3whVPIe6bctIjuxzbIYNzoQbLWaW4vpJUfnBtseJx4PVENmR96Yj7yed
	q+SHDmfHwPsUd5b9Slq84wD27Veygzi3HxKrXSodR0DyEvLLsksFEpZ1XthpDn/VFIYVoVonuQb
	nT1mM/+bWN7rXgGnOJx8AQhCXk9CwgGX5iy8qre0TYiFuGh3h00Wsoi9iNnppoJ/lFK3NyOY60d
	uT7wiOVnICPZrwJERU
X-Received: by 2002:a05:6214:458b:b0:91e:cf4d:f868 with SMTP id 6a1803df08f44-92134a990c3mr185930986d6.22.1795394937359;
        Sun, 22 Nov 2026 16:48:57 -0800 (PST)
Received: from wsfd-netdev58.anl.eng.rdu2.dc.redhat.com ([66.187.232.140])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-921349b0827sm90841726d6.8.2026.11.22.16.48.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Nov 2026 16:48:56 -0800 (PST)
From: Xin Long <lucien.xin@gmail.com>
To: network dev <netdev@vger.kernel.org>,
	linux-sctp@vger.kernel.org
Cc: davem@davemloft.net,
	kuba@kernel.org,
	Eric Dumazet <edumazet@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Marcelo Ricardo Leitner <marcelo.leitner@gmail.com>
Subject: [PATCH net-next] sctp: diag: set sin6_scope_id for IPv6 link-local lookup addresses
Date: Sun, 22 Nov 2026 19:48:56 -0500
Message-ID: <409da01d058fee776791de001ffd222069f06090.1795394936.git.lucien.xin@gmail.com>
X-Mailer: git-send-email 2.47.1
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

As gomaja noticed, sctp_diag_dump_one() builds IPv6 lookup addresses on the
stack but never sets sin6_scope_id. For link-local addresses,
__sctp_v6_cmp_addr() compares scope ids, so an exact SOCK_DIAG_BY_FAMILY
query can only match a link-local association when the caller's idiag_if is
propagated into the lookup addresses.

Set sin6_scope_id from req->id.idiag_if on both laddr and paddr before the
lookup, so that exact queries for IPv6 link-local associations can succeed
when the correct interface index is supplied.

Signed-off-by: Xin Long <lucien.xin@gmail.com>
---
 net/sctp/diag.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/net/sctp/diag.c b/net/sctp/diag.c
index c2a0de2adf6f..dc199e3e96b1 100644
--- a/net/sctp/diag.c
+++ b/net/sctp/diag.c
@@ -455,11 +455,13 @@ static int sctp_diag_dump_one(struct netlink_callback *cb,
 		memcpy(&laddr.v6.sin6_addr, req->id.idiag_src,
 		       sizeof(laddr.v6.sin6_addr));
 		laddr.v6.sin6_family = AF_INET6;
+		laddr.v6.sin6_scope_id = req->id.idiag_if;
 
 		paddr.v6.sin6_port = req->id.idiag_dport;
 		memcpy(&paddr.v6.sin6_addr, req->id.idiag_dst,
 		       sizeof(paddr.v6.sin6_addr));
 		paddr.v6.sin6_family = AF_INET6;
+		paddr.v6.sin6_scope_id = req->id.idiag_if;
 	}
 
 	return sctp_transport_lookup_process(sctp_sock_dump_one,
-- 
2.47.1

