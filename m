Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794792794;
	b=mQTSGYvbqAGyzZ6jN1cScG4dNlPmD5N5EVSkUsCfgTh7EvvGvzvE85+OjtlUw2iK6GsJ
	 f4Ct1rzJCfM+fqLemVg+ISffbikEH50omcp5NUwxkrN7uHXfNb1hRTiXQPB6vnw1WRdJm
	 f61fN8woT1htCZKHucLcu6RSD6oqQ3oETnTLCBdqMlcOqLZr1AsOMf35PPuDUW3HRNXzM
	 TNhdHFwOVvltIw5fU8Yc4Qlcc5HUz1i92gSbMLJLOi1lvO5NHawhLRslk8UuTwSYgKto4
	 18bDIiepIRBCGvisyU0SwwYy9bkARFJIUysm6yt4peOH2X3tagocLBKr0lQeLPl7mHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794792794;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=5vGs2lBzyp0j826O0Tb4RZa8XbuiPqa++er/2YoLBTM=;
	b=uVC7TP7cJ7hLTrAUWMgzJtNL4kyVzK7vipr2RwB4OemPZoe6XNULiyV1ohPXMQo8C/TV
	 /JZPkW9NctpXhiVSkiQZzcHcf5vEH/YfflTz814zQa+g6z28rYHQTWA7DYzjJB4fEaerX
	 kqKzfGDwByj+2XF58x/OMDhqCOS5+XSjouh/Ee9WCXPrNLJ1iMT/IhJ9QIC1J1+3QkAJ8
	 HAt/m9sfujpiCGltQqxtRlAv11xLPH3tTHnSLe+5eO7vHru/L/83JkSDlQYeZuiivWAl0
	 loRK0Bb8s77aCy00gcWG5+g4Zd/tYuf9hLNmovSUXLuCHVjgqKDPaIJ7ynNd/HBMFAA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cw0HoDUf;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 236DC606A31F
	for <netdev@vger.kernel.org>; Mon, 16 Nov 2026 01:33:13 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 236DC606A31F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=cw0HoDUf
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-36f8cdd30beso4234631eec.1
        for <netdev@vger.kernel.org>; Sun, 15 Nov 2026 17:33:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794792793; x=1795397593; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=5vGs2lBzyp0j826O0Tb4RZa8XbuiPqa++er/2YoLBTM=;
        b=cw0HoDUfoAqu2yoQ9RI82TKU+nd16dXnFK2QISB+XAAWbrvtn/fS9OJvxJ3dRLnvf9
         uvv5dM5vbEaNIDEidyFoeP2ckF7EwgfHfNPlz7R9PDej8aL4kNq7iKxkCAkAno+cMKUA
         pV+zjGnEwfvpXSATX6lVxnWGvXVuFVUitpJO5wCTLujHvKnfAasKo9JCa4hVuAYyg21I
         7P1+fAP8t6Y1wPwfafIlpj6XBC4BJcqr3T1pfjbRcJjHS1qcewZQqBNCO+KNYhnrUni5
         JE63uHdr+tBqRem8wrXS16P1bc+EvKBZYTF09JWzDAUtNVPvZNqjwv3AFre/7A6vX/Sa
         Ntqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794792793; x=1795397593;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=5vGs2lBzyp0j826O0Tb4RZa8XbuiPqa++er/2YoLBTM=;
        b=2bcaZAzbJG5LX0tz+6GA31DfxyA3G9ShWFcx+Tcw240fJQx9SLVX58PBvgIgib6KdF
         jIM3YrNzMFIV+u9SE+4iPDrAbDl/qSEaC9ocfDc3RumkDd+uSp7ud2VDCKhO0GQki4VL
         wIcGy24hql3MlkeoD3Lu0w/zZJB85U1uNqqV7Ngmj8FoOSJY23wycm1QfW2GTF+Sue+8
         ArbOKh3QmKYLkxfxZOhN9kHGOz5ES60D1yd55b9oqq6hN1lgphSLSs2e6JWNmVFhsx8S
         usBFQG3oefKBjIkC4MHIO4Pkb1Zh+kQXQMbJPvC5RKjUdomrh5kbGLIPvPgRQTP8nJdO
         zXhw==
X-Gm-Message-State: APuU4Z+ZkM+uFi3fiH9WqVD8xiBsQLGBcGoW/RvFi0hG3lu9PMYiX2QK
	iWVpfjOHg/T644IuoCYVNya71ynlLb+4iapOvWNeKJpVSCKH1cg5Hf28gdVt5Y1U
X-Gm-Gg: AYBFou2HGzHUxHZCkkEBtmc0ZmlrJvQmYFtezWK+Kh4CWA3alo062HPuUmBf0oYnqdb
	ofcRTYXZA/FeB5oBp244EtRL/SEDtk8YtsiSy3MdopvnnA843X+gc/Qw6CwlOBZKP2ZbHcqP6ne
	XvYR10JafZXhIltUCoV4CoNgryRUcOamHulOV/TP4WCHsfYpuiEpoilYijfN8tn03cSOQddCVcS
	ZiNZG1V5+VYtcZaOGRlkJT4qJmK2zXuRdRs0TbbE2PSPRkDndORpPqbJI3pRDjvDOK42r5ql/Y/
	75o4+OU+FFIyNf6GZdn4C0+Zj4SVctLtr5YcZxtw6jpMAUs0PzBbpA4irWQGuSXkeNI63YZ+hnT
	WKA61wyJuP4UgYzv7lfQqZk2lUQLxnlhEZJam5mfawWHSlO5O8xRe66U0BrwbO/RYzPnTyAaA9w
	kLNIm3N2dEYPVpwHBFfKm/K1UT99F0OWWNy/LY+Nz7fL1k1mfI2t7Yki0M/dc8Flm4aFr+i9qR5
	GSx5oMm5KazImM6mq0SFMbDVmVY6rfLDqIfGpMZGEv4HQ8VjcygFdbjfO2FtVUBcMkQjNrhIxDQ
	d0qG+r29mYLmbbKHERKnuDkehw==
X-Received: by 2002:a05:7300:f694:b0:375:fb27:2c59 with SMTP id 5a478bee46e88-37966c4a50emr14872296eec.20.1794792793084;
        Sun, 15 Nov 2026 17:33:13 -0800 (PST)
Received: from houminxi ([61.170.225.237])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad134sm35309648eec.27.2026.11.15.17.33.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 17:33:12 -0800 (PST)
From: Minxi Hou <houminxi@gmail.com>
To: netdev@vger.kernel.org
Cc: Aaron Conole <aconole@redhat.com>,
	Eelco Chaudron <echaudro@redhat.com>,
	Ilya Maximets <i.maximets@ovn.org>,
	Eric Dumazet <edumazet@kernel.org>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH net v4 0/2] net: openvswitch: fix a feature leak on a failed change
Date: Sun, 15 Nov 2026 20:32:59 -0500
Message-ID: <20261116013259.205882-1-houminxi@gmail.com>
X-Mailer: git-send-email 2.56.1
In-Reply-To: <179477355840.3291.10898450599671542519@kernel.org>
References: <179477355840.3291.10898450599671542519@kernel.org>
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

The bug turned up while I was writing the YNL spec for this family and
had to say what ovs_dp_change() does. The function records the new
features before the per-cpu-pids check can fail the request. A failed
request then leaves the features claiming a bit whose reference count
was never taken. Nothing triggered it in the field.

The second patch shows it happening. A set with an empty per-cpu-pids
fails with EINVAL, and on a kernel without the fix the datapath reports
the features the rejected request asked for. I ran the openvswitch
selftest suite both ways, failing on 7.2.13 and passing on 7.4.0-rc2
with the fix, in a virtual machine rather than on hardware.
