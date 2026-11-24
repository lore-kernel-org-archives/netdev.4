Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795556497;
	b=InT1kXkQhfdv+UrTHF9o8joA6ravDl4NF1oMPpvQjk8TmZRv13HXMqYinsGDcPHYkLIK
	 klN+oEtgAKabC3YPxRpIur83+hdFCEi7p6AQJeEkHgSwnHHSe10zqItZM40zVSIiyBH75
	 UPS3C+gyNYeIhMI/ncY2yRiYtGaA6IxuxSm68O/Y97v58h5C4HFkmvsl7Oz0p0/LFZWe7
	 iXES4S1E/dlpFtltTv2cfvvc9oId/pZwtWc7EB8JVbQccvyRJwGSyyHYtN+ie7I9XB5d+
	 QRwW8c4mKOojvXEMKtpxEc4b2W51ayqOX4BIJoKBVWL6eXFk6GzPCTykf2AxX2BAxrQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795556497;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:Date:From:To:Cc:
	 Subject:Message-ID:In-Reply-To:References:MIME-Version:Content-Type:
	 Content-Transfer-Encoding;
	bh=cNGW2F/OSF01dPKj5iewRe2f3lGUdb22Ia0rzGAqX+A=;
	b=QGAq7f3wKsQ2AX5yyOfvAgXmsiKX5dOG+MyLwWfXYW+X1AMHkvpc3zrf7cz3Br6lR1gV
	 77uvX8p14IdSd0nI/IncKT6q1HgwEfy94YMjZwc0IexOlNCPc0SNQ8ST8GtqdINFnCvx3
	 n19ZTN2XejZ3nwP8tF/kHBTGC1V877SO1l+uiT/PIa0ccgPg+M4bV6AprfJgoYDhSvFWE
	 AyAQ+fkiNyM0ClmlGJIZhn3OAVvIeswSr0aGruXDW1qSf85hFzEClk8gTxlBvBtG6qxI7
	 l2f6LWvK5nHZis0HUqvnDT0uQ3n8QG310yXWoG2SofizWRwYa17buxm24KdKiBaV5DA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=networkplumber.org;
	spf=pass smtp.mailfrom=networkplumber.org;
	dkim=pass header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=f9PaIf7V;
	arc=none smtp.remote-ip=209.85.216.41
Received: from mail-pj1-f41.google.com (mail-pj1-f41.google.com [209.85.216.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5EBC5606A32A
	for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 21:41:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 5EBC5606A32A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=networkplumber.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=networkplumber-org.20260707.gappssmtp.com header.i=@networkplumber-org.20260707.gappssmtp.com header.a=rsa-sha256 header.s=20260707 header.b=f9PaIf7V
Received: by mail-pj1-f41.google.com with SMTP id 98e67ed59e1d1-3b439e37813so2385491a91.3
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 13:41:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=networkplumber-org.20260707.gappssmtp.com; s=20260707; t=1795556497; x=1796161297; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=cNGW2F/OSF01dPKj5iewRe2f3lGUdb22Ia0rzGAqX+A=;
        b=f9PaIf7VBHYRzL1b85UNDJLXeqEHxZ3ZbP3+djfVXm7xI9WRJH8ChWqi1ncXEllB2n
         eRQ9nRR9HFJPRBANki0ud1Wdmj15qZCF9thpJCWc7J6Y0EMaCAWBRZBBYsmY1pYuXTiI
         xOZL0A1vngijryD8x0j3wQ2R5Nr3MoLvicwDJKUlnrX90fFcYyjX4DuQyoJsXAGS7WsD
         epXcJNNqgB5N2PPPa5RcLERWTmn7C14HO4TMd2W6ihx7qDBup06m8K3a0LOudf1YgZWz
         cL9EPgdiDK77Nn1+evTgCce5HZ5zsmELJJwwE6TJqUp0ma5vqYXn8eFTcnFsqFJMoliv
         Achw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795556497; x=1796161297;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=cNGW2F/OSF01dPKj5iewRe2f3lGUdb22Ia0rzGAqX+A=;
        b=Dx9CxqqywFM0ZZERWY8XvdulymwIwNSusisUAgs+0IX+dSRHGL9qv27XjDZp4SrT0w
         XmmgWCWd5B1xgJPZOCEsMzajNeJK67ZnYI8JEWWsPa4oTJQdtAJy5otMeBAs83ItdbY1
         qg8nMRovRgorK1KhRUE4KW1Gk9e07SodMGtx8uktIO8nc1+YwBjtzJC/3WYnr6oCij8n
         3InY5eO27N/2LEBNYL8fjjKHXDVu8ec/H0doWvyWZmy9VBc1buu51qzNC5hCGulzP74P
         GlvmtcbQ1F7wLK8ipRuWsQux9+YmHhEWNu5H26IXnsDoRzcT8PV7hRX8dHZJxkJK+16o
         CVKw==
X-Gm-Message-State: APuU4Z/Necd7Nja5gyD/jaQcIp+hBn8XpZtQAmyHfysPq4otaWGTvNQB
	gn1CC5T8MR5g8EeSNddzgvT+Z43VKXz+/ru8eGCSHI74V9lGmaykpjybFqbpXnv+4Tw=
X-Gm-Gg: AZFdTZdCMaIkrBCqIB7k/2TB+2M69WGO98hisTa0R7N/WTmRqcMG9dtyDPG6WgFCjVi
	Lu5skeTs8vaMlvZL3L/nSNtUZbfd9I9Kv6vlcmw0XdagNwuoYCgvU297P/qoyHahpSP6P2L1REM
	6eIuqQ8CU2A8r+Ru8DHb+1U6AIFus5830a3gzEmQ9/stRMCnz3JMYGmQAzByyewYBOhVEJxKYzB
	4lw0Cc5lMaN9vfPEDvOHxNnAXQKd5rThS2tmGowDAk6NkDbetWMcddO7brR/j+qIxDQXfO8GhFh
	W5H+tG+w7wOi2hbtcPqHWSU5/VAZY5fzD09S38HHGKKiUKQJ+LfQpgvGkRDcLo8gwNP+vCZ2z57
	VmIPG+4poaq1+BjHdZtq0mZQ5YG4E2rW8zO+wxAFVYoZ7hP/fEj3Se63HUzV5ICAkHR++Hl4J3n
	+XOgETt74H5/bJ3qt3+vP+mesaJ/aTNGRRfKNgVNpZEAvWVEEeh4hIVIVQTDX5zzL6EcDTANsWV
	Txjt/sq56M6Het4PZXr6a2rSILQ19K7QIuTATrm1gb/Z8PRd19Rm28Okqnl1Eyqc2ZdCX2KZn0i
	OyL0+z4C6dlaVyMYzdY+6l2MwevbJYtsrVn1g4LdpPwNCznvp48BvxCgzNzc0HRhzQ/Y8UA=
X-Received: by 2002:a17:90b:2ecb:b0:3b0:e2a9:3466 with SMTP id 98e67ed59e1d1-3b41c98a1d1mr13193063a91.16.1795556496545;
        Tue, 24 Nov 2026 13:41:36 -0800 (PST)
Received: from phoenix.local (204-195-112-43.wavecable.com. [204.195.112.43])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b792474sm11049619a91.3.2026.11.24.13.41.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 13:41:36 -0800 (PST)
Date: Tue, 24 Nov 2026 13:41:34 -0800
From: Stephen Hemminger <stephen@networkplumber.org>
To: Frank Dressler <frank@dressler.pro>
Cc: netdev@vger.kernel.org
Subject: Re: [PATCH iproute2] ss: show the process column for -T, -Z, and -z
Message-ID: <20261124134134.6a6ac43e@phoenix.local>
In-Reply-To: <20261121225031.106742-1-frank@dressler.pro>
References: <20261121225031.106742-1-frank@dressler.pro>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Sat, 21 Nov 2026 22:50:31 +0000
Frank Dressler <frank@dressler.pro> wrote:

> The process column was disabled unless -p was passed. However,
> ss with -T, -Z, and -z still collects the information, and the
> man page requires them to show it without -p.
> 
> Fixes: 84c45b8acb30 ("Reapply "ss: prevent "Process" column from being printed unless requested"")
> Signed-off-by: Frank Dressler <frank@dressler.pro>

The man page is not the source of truth here. Seems to me that adding another
column without an arg is going to upset some people.
