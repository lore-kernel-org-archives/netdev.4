Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.43
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795697645;
	b=Ki4afFlgCffHp6/FYe0hsqhjl9vRwA7hYK4ofsvl8lFW+2tJsxiLgDSMJuZt0A+8PTbl
	 T1IobpVPF0sFFoWrIBIoa/03dmHQYXYDCD5EzX/oYRDa9ucUiBviLo2X47eOZktjvpE6K
	 H6XmI/IG5+iu7EO/b16K3Eb9ooQNr1dBkLbsPLrpuT20dPe+dqWzwKGkpPR//jctvHfd1
	 J42uWT2yFyvC0akksTimOEpI6UsHtgQGVuGrHbUxzp9EyAoPHeTpA3nhbLrvatjfu/uBb
	 zXLPL557xK5xGOgNAy7AZ6bZCdCPoVA8aLHvkV6W3FqahzFHxjVnH8CUpEE5xDmyCVw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795697645;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Transfer-Encoding;
	bh=BLZcNUfK4tIDnKdvwQxl3a+7h2iUeYEBV9FE0q4Boac=;
	b=40fFmJ5+F6yOxn43EsDBzZphxcMseEkVSxDTUUVA23j106uneSBee+4t1SaAw/03Oqzb
	 WxbU96YM08Zz681pWwgKR+3/hlHKH6ukgpTiWFvW40mihJ4gipHevd6LXUMzN/5rlR7SG
	 StzGZe7+Zmbbinmej4xh2A0NjpHRQB52Ej/TV3HTkjJr0h2xSAZyf/ua+OaP+UeLfePvk
	 DwGkZtG2750FYPODFn6Fjl8jlCcZBCKZ/Lky8wa2guWaOboJzHakITVdp0eV31RJIPavy
	 sDUfhJz+ys/fLmU33TQM+5vA3QAUZcxOc9qEB1zjR7uWTzJuCUAvvv33k/J9geXU7Lw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMReC29x;
	arc=none smtp.remote-ip=74.125.82.43
Received: from mail-dl1-f43.google.com (mail-dl1-f43.google.com [74.125.82.43])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B46DB606A31C
	for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 12:54:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B46DB606A31C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=JMReC29x
Received: by mail-dl1-f43.google.com with SMTP id a92af1059eb24-1b563e32936so2854086c88.1
        for <netdev@vger.kernel.org>; Thu, 26 Nov 2026 04:54:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795697644; x=1796302444; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BLZcNUfK4tIDnKdvwQxl3a+7h2iUeYEBV9FE0q4Boac=;
        b=JMReC29xh1zbUUmGqq9nWiAz7CV1yyPILJ8HDTboWjW/nE+BCbFgGHhxPY4KNLZWEv
         I6Nb93amzs91WIuyng8cmq6mq8uvsbgjP5Mb+2BT9FzHylxovQubrj1IyqtIRkmpT8Ci
         64cHKIup69nDU46zIMXuGVm+zKZGf5Q6bTSKbz0wGtaduF7LNCisT2z9XdA4YhJ74xs7
         LPB2QYR5P5h36HXT0aoINmJ5W9j76VoLswL5qvBH9OPyQ6IED94SUWpyKB0+na+wGuJa
         G0MjqS+rwTkxApmuk37fPCcrgj4XUzkpxDZGnvFMZtngJfA/yyrOKu27BKDmiXKT7Q7+
         +4aQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795697644; x=1796302444;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BLZcNUfK4tIDnKdvwQxl3a+7h2iUeYEBV9FE0q4Boac=;
        b=Zgb2DM4IifN9col/AvPpiCW9SRNPH8Vs0y9u8X9lBMnIvN3f7Bx3+O18E0B2ZTiGVI
         m2AkLk9jgWICTwkO/MLqfuLDtxfiBGosZjqet3XfSFvHsTOQ+kYH9vjJawi07ew/vzGA
         jVKCFwnn9JOyt+Yc4yOmPnZockEQ6I/6TcnMG9HTrKy2Xd3c+ZhV13MmDRrz3fXPFVOy
         Ssq0y4bcF71Ht2xzhDCoEU4cpZIzYmGMqNhGh0EIRN4LDb92kjAAxzJRZH5BsyRd8J9H
         RLR+HqCisFIEFADM5f1k3TRl7E06+UsHIb+O36vGpOx6uMOKuMvIr7Ue7s5PUpobflPR
         bzSQ==
X-Gm-Message-State: APuU4Z+bPMkj38RfF5XCEZQb0whIHPw9k0lAnMb8SeFOAWhyTudKain5
	AwBqR89En+YTiA8D6x5Aimh22NP5KYA0tnbbtyJVub/mXkFSL3m4blRcKF0lga+YU4I=
X-Gm-Gg: AZFdTZe78yCjLXpx5O0wiFJt2NCgdtTGStdPLFXDCijwAWDqMhnGgSiE27sUXaG3HUN
	P7Rv/fB4/63x5U+zl0xhtmgEcJOw5m6fHgZBQBN4YsfhlhJ8RlN7Iu419PjdFLZlHMSC/6NRjYr
	gbNOyOYa4kIInH3CE9O/3a1P4c2le7eeXTRQXQE+VQn9GIQPbHnUuUb2CmoFeB1ki3tNZPrlVWC
	w7J6lop1rJv4dF/GnoC57rzcd7v2aEzV+abCmvGTGNWb6h94+had3kCEZEWRY7Ybg8KcjUfLae6
	DsUMsGqst5QNkpqGM10u8qjd0ms7VP2InH8WsrU09poTx+66fTWbMAjw7m/6Psx8x49eqyqrHHY
	VcVuMZFj+LFBvelAq/gyDOZbO+nq5MezcF17XN86z6BLv/HN/e3chm7hRUMFdors6KahFYWK4tD
	u5LSI869Nx+IAUyZ/b/bOzgHmS0Rl8AbpC7tg5GXp03IdEW60Lozi+nC6+IrwaMDspVkeVM9Huw
	coarxfANuoToSN9IelC+23fDSLm5slrgilhMF1Ac85Ej3USn2YQBY+ReRhEwR0f3bN8TeTCNMWR
	PlhDK9BzltUM1vRoO0FRV+NzKzI3/1NdvYNCpetP2lUn2F69r9hxKa5EOpk=
X-Received: by 2002:a05:701a:cc96:20b0:1b5:8265:33a7 with SMTP id a92af1059eb24-1b5826535c1mr7139758c88.17.1795697643730;
        Thu, 26 Nov 2026 04:54:03 -0800 (PST)
Received: from houminxi ([61.170.160.92])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1b5567ffa8csm58643880c88.7.2026.11.26.04.53.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 26 Nov 2026 04:54:03 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev-bot+sashiko@kernel.org
Cc: netdev@vger.kernel.org,
	dev@openvswitch.org,
	aconole@redhat.com,
	echaudro@redhat.com,
	i.maximets@ovn.org,
	davem@davemloft.net,
	edumazet@google.com,
	kuba@kernel.org,
	pabeni@redhat.com,
	horms@kernel.org,
	matttbe@kernel.org,
	shuah@kernel.org,
	i.maximets@redhat.com
Subject: Re: [PATCH net v6 2/3] net: openvswitch: do not record user features when the change fails
Date: Thu, 26 Nov 2026 07:53:47 -0500
Message-ID: <20261126125212.sashiko-v6-2-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179561838354.3135.13483363996689314212@kernel.org>
References: <20261124145033.627044-1-houminxi@gmail.com> <20261124145033.627044-3-houminxi@gmail.com> <179561838354.3135.13483363996689314212@kernel.org>
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 8bit

I rewrote the commit message to describe the leaked tc skb extension
reference, not a change to this datapath's packet handling. The static key
is global, so other holders can keep it enabled.

The helper comment now names the readers that still use plain loads.
The @user_features documentation describes the reference lifetime and no
longer makes a blanket claim about lockless readers. Those readers remain
unchanged. These changes are in the local v7 candidate; v7 has not been
sent.
