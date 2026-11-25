Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795593110;
	b=tcqtWkO8gZnY100TtQzO2dOZRAOcmVZ/EeiQOCz2DicTTeDLYdVL3L8fuayWYL0yMU1B
	 NoML0KI54K1EP7sWbni5Qoj9v+ENbBYGyl+AEhi6o09RBKlG7ap8j4pd2pMCGLXGbtihV
	 kRtigKOAjEaBM+Z1tQeO/Ythyy3FE6EJ67+bT6glTtDDtiKbhrRYu2oSmEq2A7Zrr7W36
	 WNSasiEK2B0UAl7whcHg5tiCbHZi26EOzfThFZ9ai9T/ijn4ZxEV9ULjatuRYNKX15k5z
	 z4hEgES2gi3HRRFpOntX66rwMwxq+eWOc9txegizD+YP/BytEKtWEz87Z2uCZ0tr6KQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795593110;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 MIME-Version:References:In-Reply-To:From:Date:X-Gm-Features:
	 Message-ID:Subject:To:Cc:Content-Type;
	bh=p0lhzOtnwWQvl01Hd5IyLv/vRq0/clLzuGz4CTZBUII=;
	b=1PyXtfO59LCcemNtnNQv38TXG14WOxySqlWhxulbreHQASWiCOQb+PO0LN09h6Uv1gVg
	 TfLXJecNo/ptqYw0xJAn5azf9zx8YTCJ1h6yhyJSNd48pCGn6eX01B95MHc3VXYUuPA7r
	 icpBeGzytDmO28olgL5So3BFZSx6L7110QUXB7hd7shqAoOmFeXLrifWdt8V0p+bOyP6y
	 lg8m60B5cWm443jlflgLUIjChKzt5f5y4RWC/rulMXcPx7k9oHmV5WJlZf4apZkPbIKQ5
	 9pKDJfrVllyBXAoV1nt0rNNlM8+kR6SdLf3yFW+o/o26JbFPQuk60Uikcn9msAk2LUw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRaYQcAJ;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.218.47
Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C18F606A321
	for <netdev@vger.kernel.org>; Wed, 25 Nov 2026 07:51:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8C18F606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=RRaYQcAJ
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-c51a14bd405so108304166b.2
        for <netdev@vger.kernel.org>; Tue, 24 Nov 2026 23:51:50 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1795593109; cv=none;
        d=google.com; s=arc-20260327;
        b=eHeJmNkDWKzaMCAl8OGSge8XxvIJGOY6DG7a3ZVpZFssY4ZHi2KqLRAKlTw4mDngRd
         UiP/+aWKxSGWX9u4GQSwU3ifGk16JYTz67hXl3vmAYBNocLq0xbSw4M4lnTuG6FBgwge
         kab3SUNmzx35U/1fS0FuqrXAxvat3ZKcgpznDr9EFwH9AILL5Ouy0+WjcZAPxdEfvHxU
         iPN5H/VXejW+e21do2X/aOVIr9QJzWPlTcFNK7sUntakRxGE/QJIlS2FKlC4iH1HprjQ
         6GrRQdknFmksU6+6ooKp2/t/QFZdaMtfJzC+n72us5eu/CQ7ErW+ssd6RFb6an0V5Xau
         iwDg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=p0lhzOtnwWQvl01Hd5IyLv/vRq0/clLzuGz4CTZBUII=;
        fh=1yPwLh6D0qipx85BfK4AOo3zcJPDO/zMzGgkQNe5eKo=;
        b=XVRfRPRp/N4mb+0Am6igwMKTu0IaX9KQAfKGFpTa8gd7sUi0fxyO9YEZTpdLM7S1la
         G6Kj11p/NAz3dUmACyrOI4twJhlfxlsZyAvDBgZKQtVn93QSAVrL4xcdBHsMshLjKpjA
         oxOuB91O09E/ubQ3XRSFqo4efHdUiFOqahDpK25YT/mR7Ix/V/ftPrI3yX7TCNxZDMTa
         tWEWCyXuc0ZkvxSeIkMvUiU38FaU7XHy+DqHRbvyVbG9b1rDlj7Gxu3K9XeQPvx9Qt66
         S/t9gVAAo51QPvm/aJRHzcNNvN46CVQGbQ6wEwn4U5/pvSG3DDATFPXpu2DxL0wGopeZ
         tN0Q==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795593109; x=1796197909; darn=vger.kernel.org;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p0lhzOtnwWQvl01Hd5IyLv/vRq0/clLzuGz4CTZBUII=;
        b=RRaYQcAJnTw6cYto2S1sQjfWCZLUqnUsXeLy6b3+ylJTBVQv0gaibjWyVaO9AfJ2ab
         Euor6O6Ab2303Cn/+k/0GOVIBYR+c0odqtBWScaUAdIpmvIlA6OULFQKkLxa92vL6gTv
         nWC8buQiBjU40qwRFdh7TdK16MW3UpTlaOko3BqhrsAJ4Yw+9b9A2jd602Pfga4wCB2J
         wg2MHIm0jpOw9S6hmOkXUXsfkAoBWNoePOjAa4UTGMcrLPGcKJX+KR+cYpTBJDa1+Yb+
         +c9vTHEheOWRFOMs2PkyVKluwC1h6X7357JRkc1IZy/OtWt7EwjiZHpuwUaZt8st8AD2
         77OQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795593109; x=1796197909;
        h=content-type:cc:to:subject:message-id:date:from:in-reply-to
         :references:mime-version:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=p0lhzOtnwWQvl01Hd5IyLv/vRq0/clLzuGz4CTZBUII=;
        b=u6pXGPzlbtl8YDGOsET+JkKgsVYmRGQgemh/sfoZCUjG1g0gzXVG5sbQgckSz1c3y8
         wD6jo/pWuH39wO731hsRHiQVwd8HysuCOMf0Eko8+6whzSrq8Is2qmm/r8R90T1cl2j4
         Nmlg2WS7/S92jFjv2py9WHsJQ6k7t+0F9n94Fe5K+gdA6IAae75ePWHcSWyNdH5w8uaC
         j5tS5fwRDFIdpR05PknwhB0h/KVi/PM/tdQJHqQdOdaB/lEjW82QTSQPhggF/QS8zLTZ
         vP2/AtRj4Kgl6c2WgEL8TY+lEJnJrSrcqAi9yFn0McBiH6FF1M8CfveoCzkQbxqDXRoF
         IYbQ==
X-Forwarded-Encrypted: i=1; AL+hErGOM1Xz3kvKe8Rh08y0N5hYIk6XpyCeQE9o11jX1l0qt8AX44uLrJ0/qCNGApdhnsdDimf+QRE=@vger.kernel.org
X-Gm-Message-State: APuU4Z8w8/Rxx7SulF09/vJMMoS1raHieS8ojKaTPcnR/tf7XtRRODlJ
	nbfuo0qddSDpFFXJ5DsmZdFCOfwts9HZG0+kfoiEeiVSZuI2pd0dpmdhnsOgMUX0CtMdf9kBh+0
	NRGcVAk0qxwGo4hmtdJ54/Lq/ZhvtHGA=
X-Gm-Gg: AZFdTZdCKnyJBXm3nMFmWknxr/tPYtEv9SnjvSaf6sa5YnG8lUMmUmiZCtThvZ82GTk
	/4pY+czcfXmAzPT4I9zV437cGww6BSjXJsBG33EoHroUhTcgrmjqXMSPqz8isV0RRzHJdqy8xk8
	X4Mf+9De+ZY2Zsso/fiwiIitgowHCW93fYmlfRhw0C/GdGmJyif1omQ4KQuET9ADSTKXWxia/se
	8vGuI/cj58Y0tmk/ssu53KTd+sH1B/U5HB/O5wK5bzVe+2FbxBW+g4kh/CLF7A4aPQww8BMhq55
	zlH1erpFqd3W2KkrGaEy8/OxCcrqXf7PGQAJXZDpXDfAL6oZB6xXdMgeXZm40mnS8co3npWvpSg
	JlFt3+fsog4xamtnc1qBCOFMBchHKJseIxw+1D88=
X-Received: by 2002:a17:906:dc91:b0:c40:231:6ea1 with SMTP id
 a640c23a62f3a-c513ac48cd7mr1278296066b.43.1795593108680; Tue, 24 Nov 2026
 23:51:48 -0800 (PST)
X-Mailing-List: netdev@vger.kernel.org
List-Id: <netdev.vger.kernel.org>
List-Post: <mailto:netdev@vger.kernel.org>
List-Help: <mailto:netdev+help@vger.kernel.org>
List-Subscribe: <mailto:netdev+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:netdev+unsubscribe@vger.kernel.org>
List-Owner: <mailto:netdev+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
References: <20261123124855.1021-3-filzador@gmail.com> <179552678713.3135.6451619234057473485@kernel.org>
In-Reply-To: <179552678713.3135.6451619234057473485@kernel.org>
From: =?UTF-8?B?0KTQuNC70LjQv9C/INCh0YPQtNCw0LrQsNGB?= <filzador@gmail.com>
Date: Wed, 25 Nov 2026 10:51:35 +0300
X-Gm-Features: Aa3M54rUw3T1CYpg45U3lzI0YpZnJlQtwZYt4-OEkXvGNy-umReq1Lk88Wbudxg
Message-ID: <CAFwykAwbXLiLkn1N+WwaQzCiVW764_RPjFSm35g3MAQHzNN0pQ@mail.gmail.com>
Subject: Re: [PATCH net v2 2/5] vmxnet3: keep the previous XDP program when
 attaching fails
To: netdev-bot+sashiko@kernel.org
Cc: ronak.doshi@broadcom.com, bcm-kernel-feedback-list@broadcom.com, 
	netdev@vger.kernel.org, bpf@vger.kernel.org, andrew+netdev@lunn.ch, 
	davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org, pabeni@redhat.com, 
	ast@kernel.org, daniel@iogearbox.net, hawk@kernel.org, 
	john.fastabend@gmail.com, sdf@fomichev.me, u9012063@gmail.com
Content-Type: text/plain; charset="UTF-8"

Thanks. Both points on 2/5 are valid, and so are the low ones on 4/5.
v3 will:

- on a failed attach, bring the device back up without XDP and return
  the error; on a failed detach, complete the detach (no program,
  reference dropped, return 0), as dev_xdp_detach_link() ignores the
  error;
- close the interface if the device cannot be restarted, with
  dev_close() rather than vmxnet3_force_close(), since the device is
  already quiesced with IRQs freed and force_close would free them
  again;
- change the redirect target feature only after success;
- count the two body buffer allocation failures in drop_total, and
  say in the 4/5 commit message that the non-XDP rx path changes too.

pw-bot: cr
